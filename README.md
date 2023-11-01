# Медиа-сервис для поиска эскизов тату и тату мастеров

1. Клонируйте репозиторий

```bash
git clone https://github.com/HSEADC/B21DZ09-L3-Project-03.git
```

2. Зайдите в папку проекта

```bash
cd B21DZ09-L3-Project-03
```

3. Установите зависимости (gems)

```ruby
bundle install
```

4. Выполните миграции базы данных

```ruby
rails db:migrate
```

5. Скачайте [изображения с тату](https://disk.yandex.ru/d/PTdfE03I45aN2w) и разместите их в `public/autoupload/tattoos`



7. Наполните сидами базу данных

```ruby
rails db:seed
```

7. Запустите сервер разработки

```ruby
bin/dev
```
