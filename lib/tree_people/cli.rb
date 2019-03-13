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
    puts "Please select from the following list to view upcoming TreePeople events, or type exit."
    puts "  1. View by location"
    puts "  2. View by category"
    puts "  3. View by day of the week"
    puts "  4. View by time of day"
    puts "  5. View all upcoming events"
    space
    user_input = gets.chomp.downcase
    space
    if user_input == "1" || user_input == "location"
      location
    elsif user_input == "2" || user_input == "category"
      category
    elsif user_input == "3" || user_input == "day of the week" || user_input == "day"
      day_of_week
    elsif user_input == "4" || user_input == "time of day" || user_input == "time"
      time_of_day
    elsif user_input == "5" || user_input == "view all" || user_input == "all"
      list_all
    elsif user_input == "exit"
    else
      invalid_selection
      menu
    end
  end


  def options(options_list)
    options_list.each do |option|
      puts "  #{option}"
    end
    space
  end


  def select_option(attribute)
    puts "Which #{attribute} would you like to see upcoming events for?"
    space
    user_input = gets.chomp.downcase
    space
    if Event.all.any?{|event| user_input == event.location.downcase || user_input == event.category.downcase || user_input == event.day.downcase || user_input == event.time_of_day.downcase}
      puts "We have the following upcoming events:"
    else
      invalid_selection
      select_option("#{attribute}")
    end
    Event.all.each do |event|
      if user_input == event.location.downcase
        @available_options << event
      elsif user_input == event.category.downcase
        @available_options << event
      elsif user_input == event.day.downcase
        @available_options << event
      elsif user_input == event.time_of_day.downcase
        @available_options << event
      end
    end
  end


  def list_selection_events
    counter = 1
    @available_options.each do |event|
      puts "  #{counter}. #{event.day}, #{event.month} #{event.date} - #{event.name}"
      counter +=1
    end
  end


  def event_details
    space
    puts "Which event would you like to see details for?"
    space
    user_input = gets.chomp.to_i
    space
    if user_input <= @available_options.count
      event = @available_options[user_input - 1]
      puts "#{event.day}, #{event.month} #{event.date} from #{event.start_time} to #{event.end_time}"
      puts "#{event.name} in #{event.location}"
      puts "#{event.category}"
      space
      puts "#{event.description}"
      space
      if event.spots_open == ""
      elsif event.spots_open.start_with?("1 ")
        puts "There is 1 space available. Event capacity information is updated every hour."
        puts "To sign up, please visit TreePeople.org#{event.url}"
        space
      else
        puts "There are #{event.spots_open}"
        puts "To sign up, please visit TreePeople.org#{event.url}"
        space
      end
      @available_options.clear
      menu_or_exit
    else
      invalid_selection
      event_details
    end
  end


  def space
    puts " "
  end


  def invalid_selection
    puts "That is not a valid selection, please try again."
    space
  end


  def menu_or_exit
    puts "Please type menu to return to the main menu, or exit to exit the program."
    space
    user_input = gets.chomp.downcase
    space
    if user_input == "menu" || user_input == "main menu"
      menu
    elsif user_input == "exit"
    else
      invalid_selection
      menu_or_exit
    end
  end


  def exit
    puts "Thank you for considering TreePeople. We hope to see you at an event soon!"
  end
end
