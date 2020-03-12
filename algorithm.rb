# frozen_string_literal: true

class Algorithm
  def self.random_put(map)
    result = []
    map.floor_map.each.with_index do |line, index_row|
      puts "Line #{line}"
      line.each.with_index do |cell, index_col|
        new_cell = cell
        if cell == '_'
          dev = map.developers.delete_at(rand(map.developers.length))
          result[dev.id] = "#{index_col} #{index_row}" if dev
          map.floor_map[index_row][index_col] = dev if dev
          new_cell = dev if dev
        end
        if cell == 'M'
          man = map.managers.delete_at(rand(map.managers.length))
          result[man.id] = "#{index_col} #{index_row}" if man
          map.floor_map[index_row][index_col] = man if man
          new_cell = man if man
        end

        adiacents = adiacent_cells(map.floor_map, index_row, index_col)

        if adiacents[0] == '_' && !new_cell.is_a?(String)
          new_dev = map.developers.max_by{ |dev| compute_tp(new_cell, dev) }
          map.developers = map.developers - [new_dev]
          map.floor_map[index_row][index_col+1] = new_dev
          result[new_dev.id] = "#{index_col+1} #{index_row}"
        end

        if adiacents[0] == 'M' && !new_cell.is_a?(String)
          new_man = map.managers.max_by{ |man| compute_tp(new_cell, man) }
          map.managers = map.managers-[new_man]
          map.floor_map[index_row][index_col+1] = new_man
          result[new_man.id] = "#{index_col+1} #{index_row}"
        end

        if adiacents[1] == '_' && !new_cell.is_a?(String)
          new_dev = map.developers.max_by{ |dev| compute_tp(new_cell, dev) }
          map.developers = map.developers - [new_dev]
          map.floor_map[index_row+1][index_col] = new_dev
          result[new_dev.id] = "#{index_col} #{index_row+1}"
        end

        if adiacents[1] == 'M' && !new_cell.is_a?(String)
          new_man = map.managers.max_by{ |man| compute_tp(new_cell, man) }
          map.managers = map.managers-[new_man]
          map.floor_map[index_row+1][index_col] = new_man
          result[new_man.id] = "#{index_col} #{index_row+1}"
        end
      end
    end

    puts "Inseriti #{map.dev_size - map.developers.size} su #{map.dev_size} developers"
    puts "Inseriti #{map.man_size - map.managers.size} su #{map.man_size} managers"
    result
  end

  def self.adiacent_cells map, row, col
    adiacents = []
    # SOPRA
    #adiacents[0] = row>0 ? map[row-1][col] : nil
    # SOTTO
    adiacents[1] = row<map.size-1 ? map[row+1][col] : nil
    # DESTRA
    adiacents[0] = col < map[row].size-1 ? map[row][col+1] : nil
    # SINISTRA
    #adiacents[3] = col>0 ? map[row][col-1] : nil
    adiacents
  end

  def self.compute_wp dev1, dev2
    return 0 unless [dev1, dev2].all?{ |d| d.is_a?(Developer) }

    skill_commons = dev1.skills & dev2.skills
    skill_all     = (dev1.skills | dev2.skills) - skill_commons
    skill_all.size * skill_commons.size
  end

  def self.compute_bp r1, r2
    return 0 if r1.company != r2.company

    r1.bonus * r2.bonus
  end

  def self.compute_tp r1, r2
    compute_wp(r1, r2) + compute_bp(r1, r2)
  end

  def self.print_result(result, size, file)
    File.open("output_files/#{file}", 'w') do |f|
      size.times do |index|
        f.puts result[index] || 'X'
      end
    end
  end
end
