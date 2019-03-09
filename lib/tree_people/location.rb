def choose_location
  location_options
  location_events
  location_details
end

def location_options #gives a list of locations
  puts "We have upcoming events at the following locations:"
  locations = Event.all.collect{|event| event.location}.uniq
  locations.each_with_index do |location, i|
    puts "   #{location}"
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
        @available_options << event
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
