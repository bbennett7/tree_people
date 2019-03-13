def list_all
  get_all_events
  list_selection_events
  event_details
end

def get_all_events
  Event.all.each do |event|
    @available_options << event
  end
end
