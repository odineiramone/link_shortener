# Link Shortener

- A input field

- A button

- When you click on button, your url will be shortned!

Easy, isn't?

## how2use?

First of all, `gem install bundle` && `bundle install`, please

Rename the `.env.example` file to just `.env`

Fill the variables with the correct values:

- `STORE_FILE=` here is the YAML file where your data will be stored (ex: `my_data.yml`)
- `BASE_URL=` url base to your app, if you'll run locally, the value will be `http://localhost:4567/` (aka Sinatra address)

And then, run `ruby application.rb` and visit `http://localhost:4567`

## Screenshot

![ibage.png](ibage.png)
