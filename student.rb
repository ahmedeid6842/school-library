require_relative "person"

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom, name = "Unknown", parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hocky
    "¯\\(ツ)/¯"
  end
end
