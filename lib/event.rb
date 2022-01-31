# event.rb - Event class - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)
# W4D1 - First steps in OOP with Ruby
# Event class with @start_date, @duration... And all needed methods to initialize, get, update...

# Useful includes
require 'time'
require_relative 'user'

class Event
  attr_accessor :start_date, :duration, :title
  attr_accessor :attendees
  @attendees = []

  def initialize(start, last_for_mn, theme)
    self.start_date = Time.parse(start)
    self.duration = last_for_mn
    self.title = theme
  end

  def add_1_attendee(my_user)
    self.attendees.push(my_user)
  end

  def add_n_attendees(my_users_tab)
    self.attendees += my_users_tab
  end

  def postpone_24h
    self.start_date += 24.hours
  end

  def postpone_minutes(delay_min)
    self.start_date += delay_min.minutes
  end

  def end_date
    self.start_date + self.duration.minutes
  end

  def is_past?
    self.start_date <= Time.now
  end

  def is_future?
    !self.is_past?
  end

  def is_soon?
    Times.now >= self.start_date && self.start_date <= Times.now + 30.minutes
  end

  def show_event
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
      tmp_list = "no attendee yet!"
    end
    puts tmp_list
  end

end

# event.rb - Event class - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)