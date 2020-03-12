class Reader

  FILE_TO_LOAD = 'a_solar.txt'

  attr_accessor :file

  def initialize
    @file = File.read('files/' + FILE_TO_LOAD)
  end

  def read

  end


end