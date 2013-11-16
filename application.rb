require 'sinatra'

class Application < Sinatra::Base
  get '/' do
    slim :index
  end
end

