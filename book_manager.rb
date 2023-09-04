class BookManager
  def initialize
    @books = []
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book

    puts "Book created with title: #{book.title}"
  end
end
