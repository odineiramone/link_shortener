# Link Shortener

- A input field

- A button

- When you click on button, your url will be shortned!

Easy, isn't?

## Made with

- Ruby 2.5.0
- Sinatra 2.0.1
- Postgres :elephant:

## Setup

- First of all, `gem install bundle` && `bundle install`, please

- Rename the `.env.example` file to `.env.development`

- Fill the variables started with `DATA` with your database values

    * *The variable `BASE_URL=` is the url base to your app, if you'll run locally, the value will be `http://localhost:4567/` (aka Sinatra address)*


- Run `bundle exec rake db:create && bundle exec rake:migrate`

- And then, run `ruby application.rb` and visit `http://localhost:4567`

## Screenshot

![ibage.png](ibage.png)
