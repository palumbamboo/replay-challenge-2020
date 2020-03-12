class Developer

  attr_accessor :company, :bonus, :skills, :id

  def initialize company, bonus, skills, id
    @company = company
    @bonus   = bonus
    @skills  = skills
    @id      = id
  end

  def n_skills
    @skills.size
  end
end