def location
  location_options
  location_events
  location_details
end

def location_options #gives a list of locations
  puts "We have upcoming events at the following locations:"
  locations = Event.all.collect{|event| event.location}.uniq
  locations.each_with_index do |location, i|
    puts "   #{i+1}. #{location}"
  end
  puts " "
end

def location_events #gives a list of events at a certain location
  puts "Which location would you like to see upcoming events for?"
  puts " "
  user_input = gets.chomp.downcase
  puts " "
  if Event.all.any?{|event| user_input == event.location.downcase}
    puts "We have the following upcoming events at your selected location:"
    counter = 1
    Event.all.each do |event|
      if user_input == event.location.downcase
        puts "    #{counter}. #{event.day}, #{event.month} #{event.date} - #{event.name}"
        counter +=1
      end
    end
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
  if user_input ==

    menu_or_exit

  else
    puts "That is not a valid selection, please try again."
    location_details
  end
end
