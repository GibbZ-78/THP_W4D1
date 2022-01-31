# event.rb - Event class - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)
# W4D1 - First steps in OOP with Ruby
# Event class with @start_date, @duration... And all needed methods to initialize, get, update...

# Useful includes
require 'time'
require_relative 'user'

class Event
  attr_accessor :start_date, :duration, :title, :attendees
  @@all_events = []

  # initialize - Méthode d'instanciation d'un EVENT, appelée par ".new()"
  def initialize(theme, start, last_for_min, participants)
    @title = theme
    @start_date = Time.parse(start)
    @duration = last_for_min
    @attendees = participants
    @@all_events << self
  end

  # add_1_attendee - Ajoute un USER au tableau des participants à l'événement courant
  def add_1_attendee(my_user)
    self.attendees.push(my_user)
  end

  # add_n_attendees - Ajoute un tableau de USERs au tableau des participants à l'événement courant
  def add_n_attendees(my_users_tab)
    self.attendees += my_users_tab
  end

  # count - Renvoie le nombre d'EVENTs instanciés
  def self.count
    return @@all_events.length
  end

  # get_all - Renvoie le tableau contenant tous les EVENTs
  def self.get_all
    return @@all_events
  end

  # show_all - Affiche le nombre d'EVENTs puis les listes 1 par 1 avec leurs attributs
  def self.show_all
    puts
    puts
    if Event.count > 0
      puts "We have #{Event.count} event(s) planned already, listed below: "
      @@all_events.each do |event_element|
        event_element.show
      end
    else
      puts "As of today, we so not have any event planned for the coming period. Feel free to create a new one, though."
    end
  end

  # postpone_24h - Reporte la "start_date" de l'EVENT courant de 24 heures
  def postpone_24h
    self.start_date += 24.hours
  end

  # postpone_minutes - Reporte la "start_date" de l'EVENT courant de "delay_min" minutes
  def postpone_minutes(delay_min)
    self.start_date += delay_min.minutes
  end

  # end_date - Calcule et renvoie la date/heure de fin d'un EVENT sur base de sa "start_date" et de sa "duration"
  def end_date
    self.start_date + self.duration.minutes
  end

  # is_past? - Renvoie "true" si l'EVENT courant est passé (i.e. sa "start_date" est antérieure à la date et l'heure courante)
  def is_past?
    self.start_date <= Time.now
  end

  # is_future? - Renvoie "true" si l'EVENT courant est à venir (i.e. is_past? est "false")
  def is_future?
    !self.is_past?
  end

  # is_soon? - Renvoie "true" si la "start_date" de l'EVENT courant est située entre le moment présent et 30' plus tard
  def is_soon?
    Times.now >= self.start_date && self.start_date <= Times.now + 30.minutes
  end

  # show_event - Affiche les attributs de l'EVENT courant
  def show
    puts
    puts  "  #{self.title.upcase}"
    puts  "  > starts at : #{self.start_date}"
    puts  "  > lasts for : #{self.duration} minutes (hence will end at #{self.start_date + self.duration.minutes})"
    print "  > gathers   : "
    tmp_list =""
    self.attendees.each do |people|
      tmp_list += "#{people.firstname} #{people.lastname} (#{people.email}), "
    end
    if !tmp_list.empty? 
      tmp_list = tmp_list[0..-2]+"."
    else
      tmp_list = "No attendee yet!"
    end
    puts tmp_list
  end

end

# event.rb - Event class - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)