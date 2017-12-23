require 'openssl'
require 'securerandom'
require 'json'
require 'uri'

require_relative 'k_bucket'
require_relative '../modules/networking'
require_relative '../modules/messages'

module Uplink
  class Node
    attr_reader :id

    def initialize(id = random_hex)
      @id = id
    end

    def attributes
      { id: @id, ip: host, port: port, scheme: 'http' }.to_json
    end

    def host
      @host ||= URI.parse(ENV.fetch('SERVICE_URI', 'http://0.0.0.0:7655')).host
    end

    def port
      @port ||= URI.parse(ENV.fetch('SERVICE_URI', 'http://0.0.0.0:7655')).port
    end

    private

    def random_hex
      SecureRandom.hex(128)
    end
  end
end
