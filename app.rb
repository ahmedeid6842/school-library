class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books(books)
    puts "Books:"
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people(people)
    puts "People:"
    people.each do |person|
      if person.is_a?(Student)
        puts "[Studnet] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      else
        puts "ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      end
    end
  end

  def create_person(kind, app)
    puts "Enter the person's name:"
    name = gets.chomp
    puts "Enter the person's age:"
    age = gets.chomp.to_i

    case kind
    when 1
      puts "Enter the student's classroom label:"
      classroom_label = gets.chomp
      classroom = Classroom.new(classroom_label)
      person = Student.new(age, classroom, name)
    when 2
      puts "Enter the teacher's specialization:"
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
    else
      puts "Invalid input."
      return
    end
    people << person
    puts "Person created with ID: #{person.id}"
  end
end
