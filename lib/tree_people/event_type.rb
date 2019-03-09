def event_type
  type_options
  type_events
  type_details
end

def type_options #gives a list of event types
  puts "We offer the following types of events:"
  types = Event.all.collect{|event| event.type}.uniq
  types.each_with_index do |type, i|
    puts "   #{type}"
  end
  puts " "
end

def type_events #gives a list of events of a certain type
  puts "Which type of event would you like to see upcoming events for?"
  puts " "
  user_input = gets.chomp.downcase
  puts " "
  if Event.all.any?{|event| user_input == event.type.downcase}
    puts "We have the following upcoming events of that type:"
    counter = 1
    Event.all.each do |event|
      if user_input == event.type.downcase
        puts "    #{counter}. #{event.day}, #{event.month} #{event.date} - #{event.name}"
        counter +=1
        @available_options << event
      end
    end
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
