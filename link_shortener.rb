require 'sinatra'
require 'sinatra/namespace'
require './config/application.rb'
require 'pry'

get '/' do
  erb :index
end

namespace '/api' do
  post '/short_url' do
    binding.pry
  end
end
