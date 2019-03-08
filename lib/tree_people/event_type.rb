def event_type
  type_options
  type_events
  type_details
end

def type_options #gives a list of event types
  puts "We offer the following types of events:"
  puts "1. Volunteer Events"
  puts "2. Tours/Hikes"
  puts " "
end

def type_events #gives a list of events of a certain type
  puts "Which type of event would you like to see upcoming events for?"
  puts " "
  user_input = gets.chomp.downcase
  puts " "
  if user_input == "volunteer events"
    puts "We have the following upcoming volunteer events:"
    puts "1. Volunteer Event 1"
    puts "2. Volunteer Event 2"
    puts " "
  elsif user_input == "tours/hikes"
    puts "We have the following upcoming tours/hikes:"
    puts "1. Tours/Hikes Event 1"
    puts "2. Tours/Hikes Event 2"
    puts " "
  else
    puts "That is not a valid selection, please try again."
    puts " "
    type_events
  end
end

def type_details #gives details on a specific event
  puts "Which event would you like to see details for?"
  puts " "
  user_input = gets.chomp
  puts " "
  if user_input == "1"
    puts "Here are details for the first event listed"
    puts " "
    menu_or_exit
  elsif user_input == "2"
    puts "Here are details for the second event listed"
    puts " "
    menu_or_exit
  else
    puts "That is not a valid selection, please try again."
    location_details
  end
end
