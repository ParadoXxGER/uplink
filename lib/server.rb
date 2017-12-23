require 'sinatra/base'
require 'json'

require_relative 'routing_table'
require_relative '../modules/routes'
require_relative '../modules/messages'
require_relative '../modules/networking'
require_relative '../modules/routes'

module Uplink
  class Server < Sinatra::Application

    configure do
      set bind: '0.0.0.0'
      set port: URI.parse(ENV.fetch('SERVICE_URI', 'http://0.0.0.0:7655')).port
      set server: 'thin'
    end

    get '/' do
      headers({'Content-Type' => 'application/json'})
      @@node.attributes
    end

    post '/exchange' do
      #@node.add_or_remove(params[:nodes])
      headers({'Content-Type' => 'application/json'})
      @@node.attributes
    end

    get '/lookup/:id' do
      redirect('https://p2pdns.org:7655')
    end

    def self.start
      @@node = Uplink::Node.new
      start!
    end
  end
end