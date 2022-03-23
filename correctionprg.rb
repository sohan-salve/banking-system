require 'byebug'
def remove_user(accNo)
 
  j=0
   while j<$users.size
    if $users[j]["name"] == "sohan"
      $users.delete_at(j)
      puts "user removed successfully"
      break
    else
      puts "user not found"
    end
    j+=1
   end
end




def money_transfer(ac1,ac2,transfer_amount)
  i=0
 # byebug
  while i<$users.size
   if $users[i]["accNo"] == ac1
     if $users[i]["balance"]>=transfer_amount
      $users[i]["balance"]-=transfer_amount
      puts "amount transfered successfully"
     else
      puts "insufficient balance"
     end
     break
   else
    puts "user not found"
   end

   i+=1
  end
  i=0
  # byebug
  while i<$users.size
    if $users[i]["accNo"] == ac2
       $users[i]["balance"]+= transfer_amount
       break
    else
      puts "user not found"
    end
    i+=1
   end
end
def  remove_user(accNo)
  j=0
   while j<=$users.size
    byebug
    if $users[j]["accNo"]==accNo
      $users.delete_at(j)
    else
      puts "user not found"
    end
    j+=1
   end
end



def deposit(accNo,amount)
  i=0
  while true
  if $users[i]["accNo"]==accNo
    $users[i]["balance"]+=amount
    puts "amount deposit successfully"
    puts "Total balance #{$users[i]["balance"]}"
    break
  else
    puts "user not found"
    break
  end
end
  i+=1

end


def withdraw(accNo,amount)
  i=0
while true
  if $users[i]["accNo"]==accNo
    if $users[i]["balance"]>=amount
      $users[i]["balance"]-=amount
      puts "collect your cash"
      puts "Total balance #{$users[i]["balance"]}"
    else
      puts "insufficient balance"
    end
    break
 else
     puts "user not found"
     break
 end
end
  i+=1

end





$users=[]
while true do
    
    puts "Enter your choice"
    puts "1. list user"
    puts "2. Add user"
    puts "3. Remove user"
    puts "4. Transfer user "
    puts "5. withdrow "
    puts "6. Deposit"
    
choice=gets.chomp.to_i
case choice
when 1
        puts "Name   A/c_no    Balance"
        i=0
        while i<$users.size
          print $users[i]["name"] 
          print "    "
          print $users[i]["accNo"]
          print "    "
          puts  $users[i]["balance"]
          i+=1
        end
   
when 2
     hs={}
     puts "enter user name "
     name=gets.chomp
     hs["name"]=name
     puts "Account number"
     accNo=gets.chomp.to_i
     hs["accNo"]=accNo
     puts "Enter amount"
     balance=gets.chomp.to_i
     hs["balance"]=balance
     $users.push(hs)
when 3
    puts "enter account number."
    accNo=gets.chomp.to_i
    remove_user(accNo)
when 4
     puts "enter your account number"
     ac1=gets.chomp.to_i
     puts "enter the account number where you wants to send money"
     ac2=gets.chomp.to_i
     puts "enter transfer amount"
     transfer_amount=gets.chomp.to_i
     money_transfer(ac1,ac2,transfer_amount)
when 5
     puts "Enter account number"
     accNo=gets.chomp.to_i
     puts "Enter amount"
     amount=gets.chomp.to_i
     withdraw(accNo,amount)
when 6
    puts "Enter a/c number"
    accNo=gets.chomp.to_i
    puts "enter amount to deposite"
    amount=gets.chomp.to_i
    deposit(accNo,amount)

else
    puts "invalid choice"
end

    puts " Do you want to continue, please enter y/n"
    option= gets.chomp
    if option==='y' || option==='Y'
        next
    else
        puts "thanks for visit"
        break
    end
end



