class PersonManager
  def initialize
    @people = []
  end

  def list_people
    @people.each do |person|
      puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  def create_person(age, name = "Unknown", parent_permission: true)
    person = Person.new(age, name, parent_permission)
    @people << person

    puts "Person created with ID: #{person.id}"
  end
end
