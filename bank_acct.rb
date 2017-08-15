class BankAccount

  @@interest_rate = 1.0006
  @@accounts = []

  def initialize
    @balance = 0
  end

  def deposit(num)
    @balance += num
  end

  
