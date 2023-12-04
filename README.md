# Медиа-сервис для поиска эскизов тату и тату мастеров

1. Склонируйте репозиторий

```bash
git clone https://github.com/HSEADC/B21DZ09-L3-Project-03.git
```

2. Перейдите в папку проекта

```bash
cd B21DZ09-L3-Project-03
```

3. Установите зависимости (gems)

```bash
bundle install
```

4. Выполните миграции базы данных

```ruby
rails db:migrate
```

5. Скачайте вручную [изображения с тату](https://disk.yandex.ru/d/PTdfE03I45aN2w) и разместите их в `public/autoupload/tattoos` или сделайте это через `*CLI`

6. Наполните сидами базу данных

```ruby
rails db:seed
```

7. Запустите сервер разработки [с компиляцией `tailwind-css` классов]

```ruby
bin/dev
```

<br/>
<br/>

<details>
<summary>Скачать изображения с тату через *CLI:</summary>

<br/>

1. Установка пакета `unzip` для `Linux`
```ruby
sudo apt-get install unzip
```
для `MacOS`

```ruby
brew install unzip
```

2. Загрузка `.zip` архива с помощью gem `yadisk`
```bash
yadisk https://disk.yandex.ru/d/t0zdYm6sBbULlg public/autoupload
```

3. Извлечение данных из `.zip` архива в `public/autoupload`
```bash
unzip public/autoupload/tattoos.zip -d public/autoupload
```

4. Удаление `.zip` архива
```bash
rm public/autoupload/tattoos.zip
```

</details>
<br/>
