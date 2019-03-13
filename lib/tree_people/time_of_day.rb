def time_of_day
  options_for_time
  select_option("time of day")
  list_selection_events
  event_details
end

def options_for_time
  puts "We have events upcoming during the following times of the day:".colorize(:light_blue)
  times = Event.all.collect{|event| event.time_of_day}.uniq
  options(times)
end
