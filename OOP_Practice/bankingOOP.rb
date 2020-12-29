class Account
  attr_reader :name, :balance
  def initialize(name, balance=100)
    @name = name
    @balance = balance
  end

  def display_balance(pin_number)
    puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
  end

  def withdraw(pin_number, amount)
    if pin == pin_number
      @balance -= amount
      puts "Withdrew $#{amount}. \nNew balance: $#{@balance}."
    else
      puts pin_error
    end
  end

  private
  
  def pin
    @pin = 1234
  end
  
  def pin_error
    "Access denied: incorrect PIN."
  end

end


my_account = Account.new("Welles", 1_000)
my_account.withdraw(1235, 424.12)
my_account.display_balance(1234) # you want a private `pin_error` method as there's no need for an instance to call it.
puts my_account.class


