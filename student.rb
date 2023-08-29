require_relative "person"

class Student < Person
  def initialize(id, age, classroom, name = "Unknown", parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end
end
