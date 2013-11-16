$:.unshift File.expand_path("../", __FILE__)

require 'sinatra'
require 'slim'
require 'sass'
require 'sprockets'
require 'json'

require "application"

Slim::Engine.set_default_options pretty: true, sort_attrs: false

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/javascripts'
  environment.append_path 'assets/stylesheets'
  run environment
end

map '/' do
  run Application
end
