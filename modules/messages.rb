require 'faraday'

module Uplink
  module Messages
    module_function

    def handshake(host, payload={})
      Faraday.post "http://#{host}:7655"
    end

    def store; end

    def find_node; end

    def find_value; end
  end
end
