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
