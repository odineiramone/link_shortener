ENV['RACK_ENV'] ||= 'development'

unless ENV['RACK_ENV'] == 'production'
  require 'dotenv'
  Dotenv.load(".env.#{ENV['RACK_ENV']}")
end

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
