require_relative 'reader'
require_relative 'map'
require_relative 'developer'
require_relative 'manager'

puts 'start program'

def load_data
  @reader = Reader.new
  @map    = @reader.read
  puts 'Data loaded'
end

load_data