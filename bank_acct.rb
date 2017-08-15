class BankAccount

  @@interest_rate = 1.0006
  @@accounts = []

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
  end

  def initialize
    @balance = 0
  end

  def deposit(num)
    @balance += num
  end

  def withdraw(num)
    @balance -= num
  end

end
