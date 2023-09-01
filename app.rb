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

  def create_book(books)
    puts "Enter the book's title:"
    title = gets.chomp
    puts "Enter the book's author:"
    author = gets.chomp

    book = Book.new(title, author)
    books << book

    puts "Book created with title: #{book.title}"
  end

  def create_rental(books, people, rentals)
    puts "Enter the person's ID:"
    person_id = gets.chomp.to_i
    person = people.find { |p| p.id == person_id }
    unless person
      puts "Person not found."
      return
    end

    puts "Enter the book's title:"
    book_title = gets.chomp
    book = books.find { |b| b.title == book_title }
    unless book
      puts "Book not found."
      return
    end

    puts "Enter the rental date (YYYY-MM-DD):"
    date = gets.chomp

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
      puts "Book: #{rental.book.title}, Date: #{rental.date}"
    end
  end
end
