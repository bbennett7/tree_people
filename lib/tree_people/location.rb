def location
  options_for_locations
  select_option("location")
  list_selection_events
  event_details
end

def options_for_locations
  puts "We have upcoming events at the following locations:"
  locations = Event.all.collect{|event| event.location}.uniq
  options(locations)
end
