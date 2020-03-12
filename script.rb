require_relative 'reader'
require_relative 'map'
require_relative 'developer'
require_relative 'manager'
require_relative 'algorithm'

puts 'start program'

def load_data
  @reader = Reader.new
  @map    = @reader.read
  puts 'Data loaded'
end

def compute_result
  result = Algorithm.random_put(@map)
  Algorithm.print_result(result, @map.dev_size + @map.man_size, @map.file_name)
  puts 'Output wrote'
end



load_data
compute_result