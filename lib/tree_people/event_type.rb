def type
  type_options
  type_events
  event_details
end

def type_options #gives a list of event types
  puts "We offer the following types of events:"
  types = Event.all.collect{|event| event.type}.uniq
  options(types)
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
