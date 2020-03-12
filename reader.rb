class Reader
  FILE_TO_LOAD = 'a_solar.txt'

  attr_accessor :file

  def initialize
    @file = File.read('input_files/' + FILE_TO_LOAD).split("\n")
  end

  def read
    width, height = @file.first.split.map(&:to_i)
    map = Map.new(width, height)
    map.floor_map = @file[1..height].map(&:chars)
    puts "loaded #{map.floor_map.size} map lines"

    developer_start  = height + 1
    developers       = @file[developer_start].to_i
    map.developers   = @file[developer_start + 1..developer_start + developers].map do |dev|
      data = dev.split
      Developer.new(data[0], data[1].to_i, data[3..-1])
    end
    puts "loaded #{map.developers.size} developers"
    
    manager_start = developer_start + developers + 1
    managers      = @file[manager_start].to_i
    map.managers  = @file[manager_start + 1..manager_start + managers].map do |man|
      data = man.split
      Manager.new(data[0], data[1].to_i)
    end
    puts "loaded #{map.managers.size} managers"

    map
  end
end
