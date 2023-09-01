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
end
