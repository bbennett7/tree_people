def category
  options_for_categories
  choose_view_option("category")
  list_available_events  
  event_details
end

def options_for_categories
  puts "We offer the following types of events:"
  categories = Event.all.collect{|event| event.category}.uniq
  options(categories)
end
