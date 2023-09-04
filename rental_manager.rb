class RentalManager
  def initialize
    @rentals = []
  end

  def list_rentals_for_person(person)
    person.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
    end
  end

  def create_rental(book, person, date)
    rental = Rental.new(date, book, person)
    @rentals << rental

    puts "Rental created with ID: #{rental.object_id}"
  end
end
