configure :production, :development do
  require './app/models/link_shortner.rb'
  require './lib/file.rb'
  require 'sinatra/config_file'
  require 'sinatra/namespace'
  require 'json'
  require 'yaml'
  require 'ostruct'

  config_file './config/secrets.yml'
end

configure :development do
  require 'pry'
end
