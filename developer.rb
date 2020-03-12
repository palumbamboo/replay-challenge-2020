class Developer

  attr_accessor :company, :bonus, :skills

  def initialize company, bonus, skills
    @company = company
    @bonus   = bonus
    @skills  = skills
  end

  def n_skills
    @skills.size
  end
end