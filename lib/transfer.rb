class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

def valid?
  #The complicated way to validate bank accounts
  #if @sender.status == "open" && @sender.balance > 0 && @receiver.status == "open" && @receiver.balance > 0
  #The smooth way to validate bank accounts
  if @sender.valid? && @receiver.valid? && (@sender.balance >= @amount)
    true
  else
    false
  end
end

def execute_transaction
if self.valid? && @status == "pending"
  @sender.balance -= @amount
  @receiver.balance += @amount
  @status = "complete"
else
  return "Transaction rejected. Please check your account balance."
  @status = "rejected"
end #endif
end

end
