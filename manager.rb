class Manager

  attr_accessor :company, :bonus, :id

  def initialize company, bonus, id
    @company = company
    @bonus   = bonus
    @id      = id
  end

end