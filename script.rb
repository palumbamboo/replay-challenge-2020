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

def compute_wp dev1, dev2
  return 0 unless [dev1, dev2].all?{ |d| d.is_a?(Developer) }

  skill_commons = dev1.skills & dev2.skills
  skill_all     = (dev1.skills | dev2.skills) - skill_commons
  skill_all.size * skill_commons.size
end

def compute_bp r1, r2
  return 0 if r1.company != r2.company

  r1.bonus * r2.bonus
end

load_data
compute_result