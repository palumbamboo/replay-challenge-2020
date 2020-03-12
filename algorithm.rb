# frozen_string_literal: true

class Algorithm
  def self.random_put(map)
    result = []
    map.floor_map.each.with_index do |line, index_row|
      line.each.with_index do |cell, index_col|
        if cell == '_'
          dev = map.developers.delete_at(rand(map.developers.length))
          result[dev.id] = "#{index_col} #{index_row}" if dev
        end
        if cell == 'M'
          man = map.managers.delete_at(rand(map.managers.length))
          result[man.id] = "#{index_col} #{index_row}" if man
        end
      end
    end
    result
  end

  def self.print_result(result, size, file)
    File.open("output_files/#{file}", 'w') do |f|
      size.times do |index|
        f.puts result[index] || 'X'
      end
    end
  end
end
