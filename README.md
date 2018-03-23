# Jobstatus

Jobstatus is a web application for monitoring the status of cron jobs for UVa Digital Library projects. 

## Dependencies

* Ruby-2.5.0

* Rails 5.1.5

* MySQL 5.0 +

## Installation

* Install MySQL `gem install mysql2`

* Make sure Gemfile includes `gem 'mysql2'`

* Copy the `config/database.yml.example`, change the host, username and password of your system and save it to `config/database.yml` 

* run `bundle install`

* run `rake db:create`

* run `rake db:migrate`

## Run the application 

* run `rails s`

* Go to [http://localhost:3000/](http://localhost:3000/)to see the page

## Test

* Curl command
