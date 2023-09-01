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
end
