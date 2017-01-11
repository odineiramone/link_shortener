require 'sinatra'
require 'sinatra/namespace'
require 'pry'

get '/' do
  erb :index
end

namespace '/api' do
  get '/short_url/:url' do
    binding.pry
  end
end
