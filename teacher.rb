require_relative "person"

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age, specialization, name = "UnKnown", parent_permission = true)
    super(id, age, name, parent_permission)
    @specialization = specialization
  end
end
