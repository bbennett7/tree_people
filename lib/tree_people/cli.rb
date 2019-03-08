#Our CLI Controller

class TreePeople::CLI
  def call
    puts "Welcome to TreePeople! We are excited to have you join our team of volunteers."
    menu
    exit
  end

  def menu
    puts "Please select from the following list to view different TreePeople events, or type exit."
    puts "   1. View by location"
    puts "   2. View by event type"
    puts "   3. View by day of the week"
    puts "   4. View by time of day"
    puts "   5. View all upcoming events" #possibly change this to month
    puts " "
    user_input = gets.chomp.downcase
    puts " "
    if user_input == ("1" || "location")
      location
    elsif user_input == ("2" || "event type")
      event_type_options
    elsif user_input == ("3" || "day of the week")
      day_of_week_options
    elsif user_input == ("4" || "time of day")
      time_of_day_options
    elsif user_input == ("5" || "view all")
      list_all
    elsif user_input == "exit"
    else
      puts "That is not a valid selection, please try again."
      menu
    end
  end

  def menu_or_exit
    puts "Please type menu to return to the main menu, or exit to exit the program."
    puts " "
    user_input = gets.chomp.downcase
    puts " "
    if user_input == ("menu" || "main menu")
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
