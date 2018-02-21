set :environment, ENV['RACK_ENV']

configure :development do
  require 'pry'
  require 'dotenv'

  Dotenv.load(".env.#{settings.environment}")
end

configure :production, :development do
  require './lib/file.rb'
  require 'sinatra/config_file'
  require 'sinatra/namespace'
  require 'json'
  require 'yaml'
  require 'ostruct'
  require 'sinatra/activerecord'

  set :database_file, './config/database.yml'
  config_file './config/secrets.yml'

  current_dir = Dir.pwd
  Dir["#{current_dir}/app/models/*.rb"].each { |file| require file }
end
