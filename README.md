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

6. Скачайте [изображения с тату](https://disk.yandex.ru/d/PTdfE03I45aN2w) в `public/autoupload/tattoos` или сделайте это через `*CLI`

7. Наполните сидами базу данных

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

1. Установите пакет `unzip` для `Linux`
```ruby
sudo apt-get install unzip
```

для `MacOS`
```ruby
brew install unzip
```

2. Создайте папку `autoupload` в `/public`
```bash
mkdir public/autoupload
```

3. Загрузите `.zip` архив с помощью gem `yadisk`
```bash
yadisk https://disk.yandex.ru/d/t0zdYm6sBbULlg public/autoupload
```

4. Извлеките данные из `.zip` архива в `public/autoupload`
```bash
unzip public/autoupload/tattoos.zip -d public/autoupload
```

5. Удалите `.zip` архив
```bash
rm public/autoupload/tattoos.zip
```

</details>
<br/>
