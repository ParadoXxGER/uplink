require 'resolv'
require_relative 'messages'
require 'timeout'


module Uplink
  module Networking
    module_function

    def bootstrap
      Timeout.timeout(10) do
        Resolv.new.getaddresses('uplink.p2pdns.org').each do |host|
          Uplink::Messages.handshake host
        end
      end
    rescue Timeout::Error
      puts "ERROR: Timeout bootstrapping!"
    rescue StandardError
      puts "ERROR: Connection aborted"
    end

  end
end
