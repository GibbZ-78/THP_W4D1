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
  User.change_password(usr_email, usr_past_password, usr_future_password)
end

# input_user - Prompt the user for useful information to then create a new USER
def input_user
  usr_tmp = []
  puts
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
  puts
  return usr_tmp
end

# add_attendees - Cycle through the USER list and propose to add each of them to the current EVENT
def add_attendees(current_event)
  compteur = 0
  User.get_all.each do |subscriber|
    print "Do you want to invite #{subscriber.firstname} #{subscriber.lastname} (#{subscriber.email}) to this new event (Y/N)? "
    if gets.chomp.upcase == "Y"
      current_event.add_1_attendee(subscriber)
      compteur += 1
    end
  end
  puts "Thank you: #{compteur} user(s) have been invited to the upcoming #{current_event.title} event"
end

# input_event - Get information to create a new EVENT
def input_event
  event_tmp = []
  puts
  print "Enter the title of your new event: "
  event_tmp[0] = gets.chomp
  print "Enter its start date: "
  event_tmp[1] = gets.chomp
  print "Enter its duration (in minutes): "
  event_tmp[2] = gets.chomp
  puts
  return event_tmp
end

# show_menu - Display the main menu to manager USERs and EVENTs
def show_menu
  puts
  puts
  puts  "  -------------------------------------------------------"
  puts  "  |  WHAT DO YOU WANT TO DO, TODAY?"
  puts  "  -------------------------------------------------------"
  puts  "  |    1. Create a new user"
  puts  "  |    2. Change the password of an existing user"
  puts  "  |    3. Display all existing users"
  puts  "  |    4. Create a new event"
  puts  "  |    5. Add attendee(s) to an existing event"
  puts  "  |    6. Update an existing event"
  puts  "  |    7. Postpone an existing event (+24h or in minutes)"
  puts  "  |    8. Display all existing events"
  puts  "  -------------------------------------------------------"
  puts  "  |"
  puts  "  |    (Q)uit program"
  puts  "  |"
  puts  "  -------------------------------------------------------"
  print "  > "
end

# app - Main method
def app
  system("clear")
  exit = false
  while !exit do
    show_menu
    choice = gets.chomp
    case choice
      when "1"
        usr_info = input_user
        my_user = User.new(usr_info[0], usr_info[1], usr_info[2], usr_info[3], usr_info[4]) 
      when "2"
        update_password
      when "3"
        User.show_all
      when "4"
        event_info = input_event
        my_event = Event.new(event_info[0], event_info[1], event_info[2], [])
        add_attendees(my_event)
      when "5"
        # Lancer une méthode qui récupère un évènement donné (sur quelle clé ?) et boucle pour lui ajouter des participants
      when "6"
        # Lancer une méthode qui permet de mettre à jour les informations d'un EVENT donnée (sur quelle clé ?)
      when "7"
        # Lancer une méthode qui permet de choisir entre +24h ou une valeur en minutes, puis reporte l'événement donné (selon quelle clé) d'autant
      when "8"
        Event.show_all
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