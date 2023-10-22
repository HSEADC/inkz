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

@tattoos_data = [
  { title: 'Иллюзия вечернего света', specialization: 'Гипноз', master_id: 1 },
  { title: 'Абстрактный космос', specialization: 'Эксперимент', master_id: 2 },
  { title: 'Сон в горах', specialization: 'Классика', master_id: 3 },
  { title: 'Поцелуй Луны', specialization: 'Мистика', master_id: 4 },
  { title: 'Механический город', specialization: 'Ретро', master_id: 5 },
  { title: 'Племенные символы', specialization: 'Этника', master_id: 6 },
  { title: 'Сакура в ветрах', specialization: 'Япония', master_id: 7 },
  { title: 'Расплывчатые краски', specialization: 'Импрессионизм', master_id: 8 },
  { title: 'Геометрия в деталях', specialization: 'Абстракция', master_id: 9 },
  { title: 'Черная магия', specialization: 'Оккультизм', master_id: 10 },
  { title: 'Амфибия', specialization: 'Эксперимент', master_id: 1 },
  { title: 'Аксиома времени', specialization: 'Ретро', master_id: 2 },
  { title: 'Вечерняя мелодия', specialization: 'Мистика', master_id: 3 },
  { title: 'Заводной робот', specialization: 'Этника', master_id: 4 },
  { title: 'Солнце и луна', specialization: 'Япония', master_id: 5 },
  { title: 'Акварельные мечты', specialization: 'Импрессионизм', master_id: 6 },
  { title: 'Графика в стиле Пикассо', specialization: 'Абстракция', master_id: 7 },
  { title: 'Сказочный пейзаж', specialization: 'Классика', master_id: 8 },
  { title: 'Древний рунный знак', specialization: 'Оккультизм', master_id: 9 },
  { title: 'Электрический ангел', specialization: 'Ретро', master_id: 10 },
  { title: 'Сон в лесу', specialization: 'Мистика', master_id: 1 },
  { title: 'Живопись без границ', specialization: 'Абстракция', master_id: 2 },
  { title: 'Шаманский талисман', specialization: 'Этника', master_id: 3 },
  { title: 'Традиции Древнего Востока', specialization: 'Япония', master_id: 4 },
  { title: 'Рисунок на берегу озера', specialization: 'Импрессионизм', master_id: 5 },
  { title: 'Астральный лабиринт', specialization: 'Оккультизм', master_id: 6 },
  { title: 'Текстуры и абстракции', specialization: 'Абстракция', master_id: 7 },
  { title: 'Мастерская живописи', specialization: 'Классика', master_id: 8 },
  { title: 'Руны и магия', specialization: 'Оккультизм', master_id: 9 },
  { title: 'Символы ветра', specialization: 'Этника', master_id: 10 },
  { title: 'Легендарный дракон', specialization: 'Мистика', master_id: 1 },
  { title: 'Гиперреализм в черно-белом', specialization: 'Абстракция', master_id: 2 },
  { title: 'Сказка на коже', specialization: 'Япония', master_id: 3 },
  { title: 'Акварельные сны', specialization: 'Импрессионизм', master_id: 4 },
  { title: 'Часы на руке', specialization: 'Ретро', master_id: 5 },
  { title: 'Иллюзии мозга', specialization: 'Эксперимент', master_id: 6 },
  { title: 'Геометрические структуры', specialization: 'Абстракция', master_id: 7 },
  { title: 'Тайны океана', specialization: 'Этника', master_id: 8 },
  { title: 'Тропики и живопись', specialization: 'Импрессионизм', master_id: 9 },
  { title: 'Магический портал', specialization: 'Оккультизм', master_id: 10 }
]

def seed
  reset_db
  create_admin
  create_users(14)
  create_masters(@masters_data)
  create_tattoos(@tattoos_data)
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_admin
  user = User.create!(email: "admin@bozzhik.md", password: 'bozzhik', is_admin: true)
  puts "Admin with #{user.email} created with id #{user.id}"
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

# ссылка на изображения tattoos // https://disk.yandex.ru/d/PTdfE03I45aN2w
def upload_random_image
  uploader = TattooImageUploader.new(Tattoo.new, :tattoo_image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'public/autoupload/tattoos', '*')).sample))
  uploader
end

def create_masters(data)
  users = User.where(is_master: true).to_a
  data.each_with_index do |master_data, index|
    user = users[index]
    master = Master.create(name: master_data[:name], nickname: master_data[:nickname], specialization: master_data[:specialization], user_id: user.id)
    puts "Master with id #{master.id} just created"
  end
end

def create_tattoos(data)
  masters = Master.all
  data.each do |tattoo_data|
    master = masters.sample
    tattoo = Tattoo.create(title: tattoo_data[:title], specialization: tattoo_data[:specialization], master_id: master.id, tattoo_image: upload_random_image, user_id: master.user.id)
    puts "Tattoo with id #{tattoo.id} for master with id #{tattoo.master.id} just created"
  end
end

seed