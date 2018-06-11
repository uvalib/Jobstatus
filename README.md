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

* To receive emails for failed or delayed jobs, pass email addresses from environment variable . Set cron job and run following command:
  
  `rake email_notification:send_email` 
  
* To send jobs with curl command, please set up an environment variable for "password"

  `password='your password'` 
  
## Test

* Test curl command: 
 `curl -H "Content-Type:application/json" 'http://localhost:3000/jobs' -d '{"name":"fedora 4 backup", "status":"success", "duration":"1093", "message":"completed backup and restore"}' -H"Accept:application/json" -H “X-Password:your password”`