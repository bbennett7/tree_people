def day_of_week
  options_for_day
  choose_view_option("day")
  list_available_events
  event_details
end

def options_for_day
  puts "We have upcoming events on the following days:"
  days = Event.all.collect{|event| event.day}.uniq
  options(days)
end
