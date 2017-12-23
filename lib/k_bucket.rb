module Uplink
  class KBucket
    # Range, formerly known as k, is the maximum of nodes in a list
    attr_reader :range

    def initialize(_range = 1024)
      @entrys = []
    end

    def add(node)
      # Todo add deduplicate mechanism
      @entrys << node
    end

    def remove(node)
      @entrys.reject! { |entry| entry.id == node.id }
    end
  end
end
