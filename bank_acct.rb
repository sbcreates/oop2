class BankAccount

  @@interest_rate = 0.0006
  @@accounts = []

  def initialize
    @balance = 0
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    new_account
  end

  def self.total_funds
    total_accounts = 0
    @@accounts.each do |account|
      total_accounts += account.balance
    end
    total_accounts
  end

  def self.interest_time
    @@accounts.each do |account|
      interest = account.balance * @@interest_rate
      account.deposit(interest)
    end
  end

  def balance
    @balance
  end

  def deposit(num)
    @balance += num
  end

  def withdraw(num)
    @balance -= num
  end

end

sarah_acct = BankAccount.create
april_acct = BankAccount.create

puts sarah_acct.balance
puts april_acct.balance

puts BankAccount.total_funds

sarah_acct.deposit(200)
april_acct.deposit(1000)

puts sarah_acct.balance
puts april_acct.balance

puts BankAccount.total_funds

BankAccount.interest_time

puts sarah_acct.balance
puts april_acct.balance

puts BankAccount.total_funds

sarah_acct.withdraw(50)
april_acct.withdraw(150)

puts sarah_acct.balance
puts april_acct.balance

puts BankAccount.total_funds
