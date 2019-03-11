def location
  location_options
  location_events
  event_details
end

def location_options #gives a list of locations
  puts "We have upcoming events at the following locations:"
  locations = Event.all.collect{|event| event.location}.uniq
  options(locations)
end

def location_events #gives a list of events at a certain location
  puts "Which location would you like to see upcoming events for?"
#  events_list
  puts " "
  user_input = gets.chomp.downcase
  puts " "
  if Event.all.any?{|event| user_input == event.location.downcase}
    puts "We have the following upcoming events for that selection:"
  else
    invalid_selection
    location_events
  end

  counter = 1
  Event.all.each do |event|
    if user_input == event.location.downcase
      puts "    #{counter}. #{event.day}, #{event.month} #{event.date} - #{event.name}"
      @available_options << event
      counter +=1
    end
  end
  puts " "
end
