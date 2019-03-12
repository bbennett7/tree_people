def time_of_day
  options_for_time
  choose_view_option("time of day")
  list_available_events
  event_details
end

def options_for_time
  puts "We have events upcoming during the following times of the day:"
  times = Event.all.collect{|event| event.time_of_day}.uniq
  options(times)
end
