require 'sinatra'

class Application < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/files'

  get '/' do
    slim :index
  end

  get '/blog' do
    redirect "https://blog.fmob.us"
  end

  get '/projects/:project' do
    project = params[:project]
    redirect "http://#{project}.fmob.us"
  end

  get '/projects/git/:project' do
    project = params[:project]
    redirect "https://github.com/fmobus/#{project}"
  end

  get '/css/*.css' do
    content_type 'text/css', :charset => 'utf-8'
    filename = params[:splat].first
    sass filename.to_sym, :views => "#{settings.root}/assets/css"
  end

  get '/id_rsa.pub' do
    File.read('assets/id_rsa.pub')
  end

end

