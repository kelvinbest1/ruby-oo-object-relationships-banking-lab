class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  
   def initialize(sender, receiver, amount = 0)
     @sender = sender
     @receiver = receiver
     @status = "pending"
     @amount = amount
   end
   
   def valid?
     if sender.valid? && receiver.valid?
       true 
     else 
       false 
     end
   end
   
   def execute_transaction
     if @sender.balance > @amount && @status == 'pending' && @sender.valid? && @receiver.valid?
       @sender.balance -= @amount
       @receiver.balance += @amount
       @status = 'complete'
     else 
       @status = "rejected"
       return "Transaction rejected. Please check your account balance."
     end
   end
   
   def reverse_transfer
     if @status == 'complete'
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = 'reversed'
     else
       nil 
     end
   end
 end