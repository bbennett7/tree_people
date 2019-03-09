#Our CLI Controller

class TreePeople::CLI
  attr_accessor :available_options
  def call
    Scraper.new.make_events
    @available_options = []
    puts "Welcome to TreePeople! We are excited to have you join our team of volunteers."
    menu
    exit
  end

  def menu
    puts "Please select from the following list to view different TreePeople events, or type exit."
    puts "   1. View by location"
    puts "   2. View by event type"
  # puts "   3. View by day of the week"
  # puts "   4. View by time of day"
  #  puts "   5. View all upcoming events"
    puts " "
    user_input = gets.chomp.downcase
    puts " "
    if user_input == "1" || user_input == "location"
      location
    elsif user_input == "2" || user_input == "event type"
      event_type
    elsif user_input == "3" || user_input == "day of the week"
      day_of_week
    elsif user_input == "4" || user_input == "time of day"
      time_of_day
    elsif user_input == "5" || user_input == "view all"
      list_all
    elsif user_input == "exit"
    else
      puts "That is not a valid selection, please try again."
      menu
    end
  end

  def event_details
    puts "Which event would you like to see details for?"
    puts " "
    user_input = gets.chomp.to_i
    puts " "
    if user_input <= @available_options.count
      event = @available_options[user_input - 1]
      puts "#{event.day}, #{event.month} #{event.date} from #{event.start_time} to #{event.end_time}"
      puts "#{event.name} in #{event.location}"
      puts "#{event.type}"
      puts " "
      puts "#{event.description}"
      puts " "
      puts "To sign up, please visit TreePeople.org#{event.url}"
      puts " "
      @available_options.clear
      menu_or_exit
    else
      puts "That is not a valid selection, please try again."
      location_details
    end
  end

  def menu_or_exit
    puts "Please type menu to return to the main menu, or exit to exit the program."
    puts " "
    user_input = gets.chomp.downcase
    puts " "
    if user_input == "menu" || user_input == "main menu"
      menu
    elsif user_input == "exit"
    else
      "That is not a valid selection, please try again."
      menu_or_exit
    end
  end

  def exit
    puts "Thank you for considering TreePeople. We hope to see you at an event soon!"
  end
end
