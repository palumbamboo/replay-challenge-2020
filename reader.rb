class Reader
  FILE_TO_LOAD = 'c_soup.txt'

  attr_accessor :file

  def initialize
    @file = File.read('input_files/' + FILE_TO_LOAD).split("\n")
  end

  def read
    width, height = @file.first.split.map(&:to_i)
    map = Map.new(width, height, FILE_TO_LOAD)
    map.floor_map = @file[1..height].map(&:chars)
    puts "loaded #{map.floor_map.size} map lines"

    developer_start  = height + 1
    developers       = @file[developer_start].to_i
    map.developers   = @file[developer_start + 1..developer_start + developers].map.with_index do |dev, index|
      data = dev.split
      Developer.new(data[0], data[1].to_i, data[3..-1], index)
    end
    map.dev_size = map.developers.size
    puts "loaded #{map.developers.size} developers"
    
    manager_start = developer_start + developers + 1
    managers      = @file[manager_start].to_i
    map.managers  = @file[manager_start + 1..manager_start + managers].map.with_index(developers) do |man, index|
      data = man.split
      Manager.new(data[0], data[1].to_i, index)
    end
    map.man_size = map.managers.size
    puts "loaded #{map.managers.size} managers"

    map
  end
end
