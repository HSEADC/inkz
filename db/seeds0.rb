@raw_text = 'Добро пожаловать в мир татуировок, где искусство и самовыражение встречаются на вашей коже! Мы предоставляем вам доступ к богатой коллекции уникальных эскизов и дизайнов для вашей будущей татуировки. Независимо от вашего стиля или предпочтений, у нас есть что-то особенное для каждого. Наши профессиональные художники создали уникальные работы искусства, которые вы можете использовать вдохновением или выбрать как готовые решения. Наш инновационный инструмент позволяет вам создавать собственные татуировки с помощью нейросети. Просто загрузите свои идеи или вдохновляйтесь нашими эскизами, и сгенерируйте уникальный дизайн, который отражает вашу индивидуальность. Если вы тату-мастер, вы можете создать профиль и поделиться своим портфолио с нашим сообществом. Это отличный способ найти новых клиентов и поделиться своим мастерством. Мы поддерживаем профессиональных художников и предоставляем платформу для продвижения вашей работы. Помимо всего этого, мы также предоставляем уникальное место - "Коммунальный блок", где вы можете организовывать и посещать публичные мероприятия, связанные с татуировками и искусством. Это место для обмена опытом, встречи с другими энтузиастами и расширения круга общения. Добро пожаловать в мир татуировок, где ваша индивидуальность и творчество находят свое выражение на вашей коже!'
@words = @raw_text.downcase.gsub(/[—.—,«»:()]/, '').gsub(/  /, ' ').split(' ')

def seed
  reset_db
  create_masters(25)
  create_tattoos(50)
end

def create_sentence
  sentence_words = []

  (7..10).to_a.sample.times do
    sentence_words << @words.sample
  end

  sentence = sentence_words.join(' ').capitalize + '.'
end

def reset_db
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end

def create_masters(quantity)
  quantity.times do
    master = Master.create(name: create_sentence, nickname: create_sentence, specialization: create_sentence)
    puts "Master with id #{master.id} just created"
  end
end

def create_tattoos(quantity)
  quantity.times do
    tattoo = Tattoo.create(title: create_sentence, specialization: create_sentence, master_id: Master.pluck(:id).sample)
    puts "Tattoo with id #{tattoo.id} for master with id #{tattoo.master.id} just created"
  end
end

seed