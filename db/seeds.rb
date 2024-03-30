def seed
  reset_db
  clean_content_folders

  create('Admin') { create_admin }
  create('Users + Masters') { create_users_and_masters(14) }
  create('Tattoos') { create_tattoos }
  create('Feedbacks') { create_feedbacks }
  create('Subscriptions') { create_subscriptions }
end

def create(model)
  puts "\e[1;35m----------[#{model}]\e[0m"
  yield
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke

  puts "\e[1;31m[Generate data]\e[0m"
  puts ""
end

def clean_content_folders
  FileUtils.rm_rf('public/uploads')
end

def create_admin
  user = User.create!(email: "admin@inkz.ru", password: 'inkzzz', is_admin: true)
  puts "Admin with #{user.email} created with id #{user.id}"
end

def create_users_and_masters(num_users)
  users = []
  (1..num_users).each do |i|
    is_master = (i <= 10)
    user_data = {
      email: "user#{i}@inkz.ru",
      password: 'inkzzz',
      is_master: is_master
    }

    user = User.create!(user_data)
    users << user

    if is_master
      master_data = {
        name: Faker::Name.name,
        nickname: Faker::Internet.username(specifier: 5..10),
        specialization: Faker::Games::WorldOfWarcraft.class_name,
        user_id: user.id
      }

      master = Master.create!(master_data)
      puts "User [#{user.email}] and Master [#{master.id}] just created. Is Master: Yes"
    else
      puts "User [#{user.email}] just created. Is Master: No"
    end
  end

  users
end

# ссылка на изображения tattoos // https://disk.yandex.ru/d/PTdfE03I45aN2w
def upload_random_image
  uploader = TattooImageUploader.new(Tattoo.new, :tattoo_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/tattoos', '*')).sample))
  uploader
end

def upload_random_feedback_image
  uploader = FeedbackImageUploader.new(Feedback.new, :feedback_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/tattoos', '*')).sample))
  uploader
end

def create_tattoos
  masters = Master.all
  styles = ["Traditional", "Realism", "Watercolor", "Geometric", "Japanese", "Blackwork"]
  parts = ["Forearm", "Back", "Wrist", "Ankle", "Ribcage", "Collarbone"]

  masters.each do |master|
    10.times do
      style = styles.sample
      part = parts.sample

      tattoo = Tattoo.create(
        title: Faker::Games::WorldOfWarcraft.hero,
        part_list: part,
        style_list: style,
        master_id: master.id,
        tattoo_image: upload_random_image,
        user_id: master.user.id,
      )

      puts "Tattoo [#{tattoo.id}] for Master #{tattoo.master.id} just created. Title: #{tattoo.title}, Tags: #{tattoo.part_list} + #{tattoo.style_list}"
    end
  end
end

def create_feedbacks(num_feedbacks = 2)
  masters = Master.all
  user_9 = User.find(9)

  masters.each do |master|
    num_feedbacks.times do |i|
      feedback_data = {
        comment: Faker::Movies::Lebowski.quote,
        rating: rand(0..5),
        user_id: user_9.id,
        master_id: master.id,
      }

      if i == 1
        feedback_data[:feedback_image] = upload_random_feedback_image
      end

      feedback = Feedback.create!(feedback_data)
      puts "Feedback [#{feedback.id}] for Master #{master.id} just created with rating [#{feedback.rating}]"
    end
  end
end

def create_subscriptions(num_users = 5)
  num_users.times do
    email = Faker::Internet.email
    subscription = Subscription.create(email: email)
    puts "Subscription [#{subscription.email}] just created."
  end
end

seed
