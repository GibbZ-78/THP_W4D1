# user.rb - User class - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)
# W4D1 - First steps in OOP with Ruby
# User class with @email, @age, initialize methods...

class User
  SEED = "Th1sIsMyS3cr3tP4553phr453"
  attr_accessor :firstname, :lastname, :email, :age, :encrypted_password
  @@user_count = 0
  @@all_users = []

  def initialize(user_fname, user_lname, user_email, user_age, user_password)
    @firstname = user_fname
    @lastname = user_lname
    @email = user_email
    @age = user_age
    @encrypted_password = User.encrypt(user_password)
    @@user_count += 1
    @@all_users.push(self)
  end

  def self.change_password(user_email, user_old_password, user_new_password)
    if User.user_exists_by_mail?(user_email)
      @@all_users.each do |item|
        if item.email == user_email
          if User.encrypt(user_old_password) == item.encrypted_password
            item.encrypted_password = User.encrypt(user_new_password)
            puts "  > Password updated."
            return true
          else
            puts "  > Input doesn't match current password, sorry. Password update aborted."
            return false
          end
        end
      end
    else
      puts "  > User with e-mail #{user_email} does not exist. Password update aborted."
      return false
    end
  end

  def show
    puts "  > Name: #{self.lastname} #{self.firstname} - Age: #{self.age} - Email: #{self.email} - Password (encrypted): #{self.encrypted_password}}"
  end

  def self.count
    return @@user_count
  end

  def self.all
    puts "We have #{@@user_count} user(s) registered already, listed below: "
    @@all_users.each do |user_element|
      user_element.show
    end
  end

  private

  def self.encrypt(string_to_encrypt)
    tmp_length = (SEED.length < string_to_encrypt.length) ? SEED.length : string_to_encrypt.length
    tmp_return = ""
    tmp_length.times do |i|
      tmp_return += (SEED[i].ord ^ string_to_encrypt[i].ord).chr
    end
    return tmp_return
  end

  def self.user_exists_by_mail?(mail)
    exist_or_not = false
    @@all_users.each do |item|
      exist_or_not ||= (item.email == mail)
    end
    return exist_or_not
  end

end

# user.rb - User class - Coded with love & sweat by Jean-Baptiste VIDAL for the THP Developer curriculum (Winter 2022)