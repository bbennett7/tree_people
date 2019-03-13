def category
  options_for_categories
  select_option("category")
  list_selection_events
  event_details
end

def options_for_categories
  puts "We offer the following types of events:"
  categories = Event.all.collect{|event| event.category}.uniq
  options(categories)
end
