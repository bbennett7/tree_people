def day_of_week
  options_for_day
  select_option("day")
  list_selection_events
  event_details
end

def options_for_day
  puts "We have upcoming events on the following days:".colorize(:light_blue)
  days = Event.all.collect{|event| event.day}.uniq
  options(days)
end
