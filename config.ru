$:.unshift File.expand_path("../", __FILE__)

require 'sinatra'
require 'slim'
require 'sassc'
require 'sprockets'
require 'json'

require "application"

use Rack::ContentLength

Slim::Engine.set_default_options pretty: true, sort_attrs: false

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/js'
  environment.append_path 'assets/css'
  environment.append_path 'assets/img'
  run environment
end

map '/' do
  run Application
end
