require_relative "nameable"
require_relative "decorator"
require_relative "capitalize-decorators"
require_relative "trimmer-decorator"

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, age, name = "Unknown", parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, "maximilianus")
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
