# README

This README would normally document whatever steps are necessary to get the
application up and running.

Відповідно до завдання було треба реалізувати пошук користувача GitHub по логіну, з отриманням ім'я та списку репозиторіїв. код на Ruby, використовуючи Graphql,на даному єтапі було використано вбудовані модулі:
require 'json'
require 'net/http'
require 'uri'

Файли, на які треба звернути увагу:
app/controllers/users_controller.rb
db/schema.rb
app/views/users/index.html.erb
app/views/users/new.html.erb
app/views/users/show.html.erb
config/routes.rb

Додані лінтери.
З тестуванням зараз розбираюсь.

Things you may want to cover:

* Ruby version
  ruby '3.1.2'

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
