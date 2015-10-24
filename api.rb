ENV['RACK_ENV'] ||= 'development'
 
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require "sinatra/base"
require "sinatra/namespace"

Dir[File.join(File.dirname(__FILE__), 'models', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'api', 'helpers', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), 'api', '**', '*.rb')].each {|file| require file }

class Api < Sinatra::Base
  set :root, File.dirname(__FILE__)

  register Sinatra::Namespace
  register Routing::Triggers
  register Routing::Base
end