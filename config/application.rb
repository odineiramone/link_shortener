set :environment, :development

configure :development do
  require 'pry'
  require 'dotenv'

  Dotenv.load
end

configure :production, :development do
  require './lib/file.rb'
  require 'sinatra/config_file'
  require 'sinatra/namespace'
  require 'json'
  require 'yaml'
  require 'ostruct'
  require 'sinatra/activerecord'

  config_file './config/secrets.yml.erb'

  current_dir = Dir.pwd
  Dir["#{current_dir}/app/models/*.rb"].each { |file| require file }
end
