require 'sinatra'
require './config/application.rb'

get '/' do
  erb :index
end

get '/:code' do
  original_url = LinkShortner.find_link(code: params[:code])
  redirect to original_url
end

namespace '/api' do
  post '/short_url' do
    urls = LinkShortner.process_original_link(params[:complete_link],
                                              request.ip,
                                              Time.now)

    payload = { short_url: settings.base_url + urls[:code] }
    payload[:original_url] = urls[:original_url]
    return payload.to_json
  end
end
