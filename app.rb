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

  def create_studnet(age, name, classroom_label, permission_input)
    classroom = Classroom.new(classroom_label)

    permission = permission_input == "y"

    person = Student.new(age, classroom, name, parent_permission: permission)

    people << person
    puts "Person created with ID: #{person.id}"
  end

  def create_teacher(age, name, specialization)
    person = Teacher.new(age, specialization, name)

    people << person
    puts "Person created with ID: #{person.id}"
  end

  def create_book(books, title, author)
    book = Book.new(title, author)
    books << book

    puts "Book created with title: #{book.title}"
  end

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    rentals << rental

    puts "Rental created with ID: #{rental.object_id}"
  end

  def list_rentals_for_person(people)
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i
    person = people.find { |p| p.id == person_id }
    unless person
      puts "Person not found."
      return
    end

    puts "Rentals for #{person.name}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
