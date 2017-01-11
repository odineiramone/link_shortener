require 'sinatra'
require './config/application.rb'

get '/' do
  erb :index
end

get '/:code' do
  redirect to '/'
end

namespace '/api' do
  post '/short_url' do
    urls = LinkShortner.process_original_link(params[:complete_link])

    payload = { short_url: 'http://loda.sh/' + urls[:code] }
    payload[:original_url] = urls[:original_url]

    return payload.to_json
  end
end
