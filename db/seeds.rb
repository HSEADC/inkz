@masters_data = [
  { name: 'Максим Максимович', nickname: 'bozzhik' },
  { name: 'Ярослав Ярославович', nickname: 'YaroslavTattoo' },
  { name: 'Игорь Игоревич', nickname: 'IgorMaster' },
  { name: 'Владимир Владимирович', nickname: 'VladInk' },
  { name: 'Анна Андреевна', nickname: 'AnnaTribal' },
  { name: 'Борис Борисович', nickname: 'BorisInkkk' },
  { name: 'Святослав Святославович', nickname: 'SvetGeometric', },
  { name: 'Святополк Святополкович', nickname: 'PolkGrey', },
  { name: 'Мстислав Мстиславович', nickname: 'MstTattoo', },
  { name: 'Вячеслав Вячеславович', nickname: 'SlavBio', },
]

def seed
  reset_db
  create_users(14)
  create_admin

  create_masters(@masters_data)
  create_feedbacks
  create_tattoos
  create_subscriptions
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_users(num_users)
  (1...num_users).map do |i|
    is_master = (i <= 10)
    user_data = {
      email: "user#{i}@bozzhik.md",
      password: 'bozzhik',
      is_master: is_master
    }

    user = User.create!(user_data)
    puts "User with #{user.email} created with id #{user.id}. Is Master: #{is_master ? 'Yes' : 'No'}"
  end
end

def create_admin
  user = User.create!(email: "admin@bozzhik.md", password: 'bozzhik', is_admin: true)
  puts "Admin with #{user.email} created with id #{user.id}"
end

def create_masters(data)
  users = User.where(is_master: true).to_a
  data.each_with_index do |master_data, index|
    user = users[index]
    master = Master.create(name: master_data[:name], nickname: master_data[:nickname], specialization: master_data[:specialization], user_id: user.id)
    puts "Master with id #{master.id} just created"
  end
end

def create_feedbacks(num_feedbacks = 2)
  masters = Master.all
  user_9 = User.find(9)

  masters.each do |master|
    num_feedbacks.times do
      feedback_data = {
        comment: Faker::Lorem.sentence,
        rating: rand(0..5),
        user_id: user_9.id,
        master_id: master.id
      }
      feedback = Feedback.create!(feedback_data)
      puts "Feedback with id #{feedback.id} for Master with id #{master.id} just created. [#{feedback.comment}] —  #{feedback.rating}"
    end
  end
end

# ссылка на изображения tattoos // https://disk.yandex.ru/d/PTdfE03I45aN2w
def upload_random_image
  uploader = TattooImageUploader.new(Tattoo.new, :tattoo_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/tattoos', '*')).sample))
  uploader
end

def create_tattoos(num_tattoos = 2)
  masters = Master.all

  masters.each do |master|
    num_tattoos.times do
      tattoo = Tattoo.create(
        title: Faker::Lorem.words(number: 3).join(' '),
        specialization: Faker::Lorem.word,
        master_id: master.id,
        tattoo_image: upload_random_image,
        user_id: master.user.id
      )

      puts "Tattoo with id #{tattoo.id} for master with id #{tattoo.master.id} just created. Title: #{tattoo.title}, Specialization: #{tattoo.specialization}"
    end
  end
end

def create_subscriptions(num_users = 5)
  num_users.times do
    email = Faker::Internet.email
    subscription = Subscription.create(email: email)
    puts "Subscription with email #{subscription.email} just created"
  end
end

seed
