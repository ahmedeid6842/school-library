require_relative "app"
require_relative "book"
require_relative "person"
require_relative "student"
require_relative "teacher"
require_relative "rental"
require_relative "classroom"

def main
  app = App.new

  loop do
    puts "What would you like to do?"
    puts "1. List all books"
    puts "2. List all people"
    puts "3. Create a person"
    puts "4. Create a book"
    puts "5. Create a rental"
    puts "6. List rentals for a person"
    puts "7. Quit"

    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_books(app.books)
    when 2
      app.list_people(app.people)
    when 3
      puts "Enter the kind of person (1 for student, 2 for teacher):"
      kind = gets.chomp.to_i
      app.create_person(kind, app)
    when 4
      app.create_book(app.books)
    when 5
      app.create_rental(app.books, app.people, app.rentals)
    when 6
      puts "Enter the person's ID:"
      app.list_rentals_for_person(app.people)
    when 7
      break
    else
      puts "Invalid choice."
    end

    puts ""
  end
end

main
