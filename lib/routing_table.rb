require 'singleton'

module Uplink
  class RoutingTable
    # Complexity describes the maximum of walkable parts in the network: 2^32 -> 4294967296 id hashes
    # A basic Kademlia network with 2n nodes will only take n steps (in the worst case) to find that node.
    attr_reader :complexity
    attr_reader :buckets

    include Singleton

    def initialize(complexity = 128)
      @complexity = complexity
      @buckets = []
    end

    def add(bucket)
      @buckets << bucket
    end
  end
end
