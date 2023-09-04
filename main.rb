require_relative "app"
require_relative "book"
require_relative "person"
require_relative "student"
require_relative "teacher"
require_relative "rental"
require_relative "classroom"

MENU_OPTIONS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals_for_person,
  7 => :exit,
}.freeze

def main
  app = App.new

  loop do
    display_menu_options

    choice = gets.chomp.to_i

    if MENU_OPTIONS.key?(choice)
      break if choice == 7

      send(MENU_OPTIONS[choice], app)
    else
      puts "Invalid choice."
    end

    puts ""
  end
end

def display_menu_options
  puts "What would you like to do?"
  puts "1. List all books"
  puts "2. List all people"
  puts "3. Create a person"
  puts "4. Create a book"
  puts "5. Create a rental"
  puts "6. List rentals for a person"
  puts "7. Exit"
end

def list_books(app)
  app.list_books(app.books)
end

def list_people(app)
  app.list_people(app.people)
end

def create_person(app)
  puts "Enter the kind of person (1 for student, 2 for teacher):"
  kind = gets.chomp.to_i
  puts "Enter the person's name:"
  name = gets.chomp
  puts "Enter the person's age:"
  age = gets.chomp.to_i

  case kind
  when 1
    puts "Enter the student's classroom label:"
    classroom_label = gets.chomp

    puts "Has parent permission? [Y/N]:"
    permission_input = gets.chomp.downcase
    app.create_studnet(age, name, classroom_label, permission_input)
  when 2
    puts "Enter the teacher's specialization:"
    specialization = gets.chomp
    app.create_teacher(age, name, specialization)
  else
    puts "Invalid input."
    nil
  end
end

def create_book(app)
  puts "Enter the book's title:"
  title = gets.chomp
  puts "Enter the book's author:"
  author = gets.chomp
  app.create_book(app.books, title, author)
end

def list_books_rental(books)
  puts "Select a book from the book list number:"
  books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
  end
end

def list_people_rental(people)
  puts "Select a person from the following list by number:"
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

def create_rental(app)
  list_books_rental(app.books)

  book_number = gets.chomp.to_i
  book = app.books[book_number]
  unless book
    puts "Invalid book number."
    return
  end

  list_people_rental(app.people)
  person_number = gets.chomp.to_i
  person = app.people[person_number]
  unless person
    puts "Invalid person number."
    return
  end

  puts "Enter the rental date (YYYY-MM-DD):"
  date = gets.chomp

  app.create_rental(date, book, person)
end

def list_rentals_for_person(app)
  app.list_rentals_for_person(app.people)
end

main
