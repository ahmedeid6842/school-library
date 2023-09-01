require_relative 'app'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

MENU_OPTIONS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals_for_person,
  7 => :exit
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
      puts 'Invalid choice.'
    end

    puts ''
  end
end

def display_menu_options
  puts 'What would you like to do?'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Exit'
end

def list_books(app)
  app.list_books(app.books)
end

def list_people(app)
  app.list_people(app.people)
end

def create_person(app)
  puts 'Enter the kind of person (1 for student, 2 for teacher):'
  kind = gets.chomp.to_i
  app.create_person(kind, app)
end

def create_book(app)
  app.create_book(app.books)
end

def create_rental(app)
  app.create_rental(app.books, app.people, app.rentals)
end

def list_rentals_for_person(app)
  app.list_rentals_for_person(app.people)
end

main
