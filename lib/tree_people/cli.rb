#Our CLI Controller

class TreePeople::CLI
  def call
    puts "Welcome to TreePeople! We are excited to have you join our team of volunteers."
    menu

    #exit
  end

  def menu
    puts "Please select from the following list to view different TreePeople events, or type exit."
    puts "   1. View by location"
    puts "   2. View by event type"
    puts "   3. View by day of the week"
    puts "   4. View by time of day"
    puts "   5. View all upcoming events" #possibly change this to month
    user_selection = gets.chomp.downcase
    while user_selection != "exit"
      case user_selection
      when "1" || "location"
        location_options
      when "2" || "event type"
        event_type_options
      when "3" || "day of the week"
        day_of_week_options
      when "4" || "time of day"
        time_of_day_options
      when "5" || "view all"
        list_all
      else
        puts "We don't understand that command. Please select from the list of options, or type exit"
        menu
      end
    end
  end

  def location_options
    puts "We have upcoming events at the following locations:"
    puts "1. Beverly Hills"
    puts "2. Van Nuys"
    puts "Which location would you like to see upcoming events for?"
    location_choice = gets.chomp

    if location_choice = "Beverly Hills"
      puts "1. BevHills Event 1"
      puts "2. BevHills Event 2"
    elsif @location_choice = "Van Nuys"
      puts "1. Van Nuys Event 1"
      puts "2. Van Nuys Event 2"
    else
      puts "I'm sorry, we don't have any events in that location. Please try again."
      location_options
    end

    puts "Which event would you like to see details for?"
    event_choice = gets.chomp

    while event_choice != "exit"
      

  end

  def location
  end

  def event_type_options
    puts "We have the following event types upcoming:"
    puts "1. Hike"
    puts "2. Cleanup"
    puts "Which event type would you like to see upcoming events for?"
    @event_type_choice = gets.chomp
  end

  def day_of_week_options
    puts "Which day would you like to see upcoming events for?"
    puts "Monday"
    puts "Tuesday"
    puts "Wednesday"
    @day_choice = gets.chomp
  end

  def time_of_day_options
    puts "Which time would you like to see upcoming events for?"
    puts "Morning"
    puts "Afternoon"
    puts "Evening"
    @time_choice = gets.chomp
  end

  def list_all
    puts "Here is a list of all upcoming TreePeople events:"
    puts "1. Event1"
    puts "2. Event2"
    puts "Which event would you like to see details for?"
    @event_choice = gets.chomp
  end

  def exit
    puts "Thank you for considering TreePeople. We hope to see you at an event soon!"
  end
end
