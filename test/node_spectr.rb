require 'spectr'
require 'byebug'
require_relative '../lib/node'

Spectr.new.test 'Test a p2p node' do |_test|
  node = Uplink::Node.new

  byebug
end
