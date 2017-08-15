class Book

  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
    @due_date = nil
  end

  def self.create(a, b, c)
    new_book = Book.new(a, b, c)
    @@on_shelf << new_book
    new_book
  end

  def self.current_due_date
    Time.now + 259200
  end

  def self.overdue_books
    @@on_loan.each do |book|
      if book.due_date < Time.now
        book
      end
    end
    false
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  #Reader
  def due_date
    @due_date = Book.current_due_date
  end

  #Writer
  def due_date=(num)
    @due_date = num
  end


  def borrow
    if lent_out? == false
      Book.current_due_date
      @@on_shelf.delete(self)
      @@on_loan << self
      true
    else
      false
    end
  end

  def return_to_library
    if lent_out? == true
      due_date= nil
      @@on_loan.delete(self)
      @@on_shelf << self
      true
    else
      false
    end
  end

  def lent_out?
    @@on_shelf.each do |book|
      if book == self
        return false
      end
    end
    true
  end

end

rain = Book.create("Rain", "DC Costa", 3452435)
p rain.inspect
nickle = Book.create("Nickle", "SB Costa", 34502394857)
p nickle.inspect
hubble = Book.create("Hubble", "Mallory Morris", 298745893)
p hubble.inspect

p Book.browse.inspect
p Book.browse.inspect
p Book.browse.inspect

p Book.available.inspect

p Book.borrowed.inspect

p rain.lent_out?
p rain.borrow.inspect
p rain.lent_out?
p rain.due_date

p Book.available.inspect

p Book.borrowed.inspect
p "=============="
p Book.overdue_books
p "=========="
