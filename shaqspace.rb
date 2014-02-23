#!/usr/bin/env ruby
#
# Application code/ routes

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'routes')
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'sinatra'
require 'resque'
require 'fuggery/rackspace/servers'
require 'fuggery/rackspace/spinup'

require 'helpers'
require 'create'

class Shaq < Sinatra::Application
  configure do
    use Rack::Session::Pool
    set :session_secret, 'some_placeholder'
  end

  load 'login_routes.rb'
  load 'create_routes.rb'
  load 'server_routes.rb'
end
