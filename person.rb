class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, age, name = "Unknown", parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end
