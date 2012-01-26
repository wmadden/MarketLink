#!/usr/bin/env ruby
# vim: set sw=2 sts=2 et tw=80 :

require 'sinatra'
require 'sass'
require 'compass'
require 'coffee_script'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'sass'
  end

  set :sass, Compass.sass_engine_options
end

get '/' do
    redirect to('/index.html')
end

get '/stylesheets/*.css' do |stylesheet|
  if File.exists?( "public/stylesheets/#{stylesheet}.css" )
    send_file( "stylesheets/#{stylesheet}.css" )
  elsif File.exists?( "sass/#{stylesheet}.sass" )
    sass File.read( "sass/#{stylesheet}.sass" ), :style => :expanded
  elsif File.exists?( "sass/#{stylesheet}.scss" )
    scss File.read( "sass/#{stylesheet}.scss" ), :style => :expanded
  else
    404
  end
end

get '/javascripts/*.js' do |js|
  if File.exists?( "public/javascripts/#{js}.js" )
    send_file( "javascripts/#{js}.js" )
  elsif File.exists?( "coffee/#{js}.coffee" ) 
    coffee File.read( "coffee/#{js}.coffee" )
  else
    404
  end
end
