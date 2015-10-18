require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('query_optimizer', '0.1.1') do |p|
  p.description     = "Minimize query for fetching table row"
  p.url             = "http://github.com/akshaygoyal88/query_optimizer"
  p.author          = "Akshay Goyal"
  p.email           = "akshay.goyal1008@gmail.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }