# app.rb - Main Ruby program - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)
# W4D1 - First steps in OOP with Ruby
# Main class / program

# Useful includes
require 'bundler'
Bundler.require
require_relative 'lib/user'
require_relative 'lib/event'

# update_password - Ask for user e-mail, old and new password then update it if all matches
def update_password
  puts
  print "Enter e-mail address of user you want to change password for : "
  usr_email = gets.chomp
  print "Enter old password: "
  usr_past_password = gets.chomp
  print "Enter new password: "
  usr_future_password = gets.chomp
  puts
  test_change_pass = User.change_password(usr_email, usr_past_password, usr_future_password)
end


# input_user - Create a new user by prompting for information
def input_user
  usr_tmp = []
  print "Enter first name: "
  usr_tmp[0] = gets.chomp
  print "Enter last name: "
  usr_tmp[1] = gets.chomp
  print "Enter e-mail address: "
  usr_tmp[2] = gets.chomp
  print "Enter age: "
  usr_tmp[3] = gets.chomp.to_i
  print "Enter password: "
  usr_tmp[4] = gets.chomp
  return usr_tmp
end

# add_attendee - 
def add_attendee

end

# create_event - 
def create_event

end

# app - Main method
def app
  system("clear")
  exit = false
  while !exit do
    puts
    puts
    puts "What do you want to do, today ?"
    puts "  1. Input a new user"
    puts "  2. Change the password of a given user"
    puts "  3. Display all users"
    puts "  4. Create a new event"
    puts "  5. Add attendee(e) to an existing event"
    puts "  6. Update an existing event"
    puts "  7. Postpone an event (+24h or in minutes)"
    puts
    print " > "
    choice = gets.chomp
    case choice
      when "1"
        usr_info = input_user
        my_user = User.new(usr_info[0], usr_info[1], usr_info[2], usr_info[3], usr_info[4]) 
      when "2"
        update_password
      when "3"
        User.all
      when "4"
        create_event
      when "5"
        add_attendee
      else
        exit = true
    end
    puts
    puts
  end
end

# Runs main method calling all others
app

# app.rb - Main Ruby program - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)