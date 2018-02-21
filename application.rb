require 'sinatra'
require './config/application.rb'

get '/' do
  erb :index
end

get '/:code' do
  shorted_url = ShortedUrl.find_by(code: params[:code])
  redirect to shorted_url.original_url
end

namespace '/api' do
  post '/short_url' do
    complete_link = if params[:complete_link].starts_with? 'http'
                      params[:complete_link]
                    else
                      'http://' + params[:complete_link]
                    end

    attributes = {
      code: SecureRandom.hex(3),
      original_url: complete_link,
      request_ip: request.ip
    }

    link = ShortedUrl.create(attributes)

    payload = { short_url: 'http://' + settings.base_url + '/' + link.code }
    payload[:original_url] = link.original_url
    return payload.to_json
  end
end
