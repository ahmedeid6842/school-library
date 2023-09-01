class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books(books)
    puts 'Books:'
    books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_people(people)
    puts 'People:'
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

    permission = permission_input == 'y'

    person = Student.new(age, classroom, name, parent_permission: permission)

    people << person
    puts "Person created with ID: #{person.id}"
  end

  def create_teacher(age, name, specialization)
    person = Teacher.new(age, specialization, name)

    people << person
    puts "Person created with ID: #{person.id}"
  end

  def create_person(kind, _app)
    puts "Enter the person's name:"
    name = gets.chomp
    puts "Enter the person's age:"
    age = gets.chomp.to_i

    case kind
    when 1
      puts "Enter the student's classroom label:"
      classroom_label = gets.chomp

      puts 'Has parent permission? [Y/N]:'
      permission_input = gets.chomp.downcase

      create_studnet(age, name, classroom_label, permission_input)
    when 2
      puts "Enter the teacher's specialization:"
      specialization = gets.chomp
      create_teacher(age, name, specialization)
    else
      puts 'Invalid input.'
      nil
    end
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

  def list_people_rental(people)
    puts 'Select a person from the following list by number:'
    people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
      else
        puts "#{index}) Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
      end
    end
  end

  def list_books_rental(books)
    puts 'Select a book from the book list number:'
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_rental(books, people, rentals)
    list_books_rental(books)

    book_number = gets.chomp.to_i
    book = books[book_number]
    unless book
      puts 'Invalid book number.'
      return
    end

    list_people_rental(people)
    person_number = gets.chomp.to_i
    person = people[person_number]
    unless person
      puts 'Invalid person number.'
      return
    end

    puts 'Enter the rental date (YYYY-MM-DD):'
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
      puts 'Person not found.'
      return
    end

    puts "Rentals for #{person.name}:"
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end
end
