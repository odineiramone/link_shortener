configure :production, :development do
  require './app/models/link_shortner.rb'
  require "sinatra/config_file"
  require 'sinatra/namespace'
  require 'json'
  require 'yaml'

  config_file './config/secrets.yml'
end

configure :development do
  require 'pry'
end
