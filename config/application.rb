configure :production, :development do
  require './app/models/*'
  require './lib//*'
end

configure :development do

end
