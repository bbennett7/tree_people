def location
  location_options
  location_events
  location_details
end

def location_options #gives a list of locations
  puts "We have upcoming events at the following locations:"
  puts "1. Beverly Hills"
  puts "2. Van Nuys"
  puts " "
end

def location_events #gives a list of events at a certain location
  puts "Which location would you like to see upcoming events for?"
  puts " "
  user_input = gets.chomp.downcase
  puts " "
  if user_input == "beverly hills"
    puts "We have the following upcoming events at your selected location:"
    puts "1. BevHills Event 1"
    puts "2. BevHills Event 2"
    puts " "
  elsif user_input == "van nuys"
    puts "We have the following upcoming events at your selected location:"
    puts "1. Van Nuys Event 1"
    puts "2. Van Nuys Event 2"
    puts " "
  else
    puts "That is not a valid selection, please try again."
    puts " "
    location_events
  end
end

def location_details #gives details on a specific event 
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
