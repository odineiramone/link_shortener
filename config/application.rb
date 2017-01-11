configure :production, :development do
  require './app/models/link_shortner.rb'
  require 'sinatra/namespace'
  require 'json'
end

configure :development do
  require 'pry'
end
