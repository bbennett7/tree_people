

How to build a CLI Gem
  1. Plan your gem, imagine your interface
  2. Start with the project structure - google
  3. Start with the entry point - the file run
  4. Force that to build the CLI
5. Stub out the interface
6. Start making things real
7. Discover objects
8. Program

A command line interface to view and search through the next 20 TreePeople events by location, type, day of the week, etc.

user types tree_people

Gives following view options:

1. View events by location
2. View events by type
3. View events by day of week
4. View events by time of day
5. View all upcoming tree_people events

  Prompt user to select how to view

Offers different options for each (list of location, list of type, etc.)

  Prompts user to select a specific

Shows all events that match that criteria
1. Monday, March 11 at 11am - Moonlight Hike in Beverly Hills
2. Monday March 11 at 2pm - Street Planting in Van Nuys

  Prompt user to choose an event to get details on

Shows for the chosen event:
- Monday, March 11 from 11am to 2pm
- Location: Beverly Hills
- Description: Enjoy a moonlight hike in Beverly Hills
- Availability: 6 spots open
- To sign up for this event, please visit: <URL>
- Type menu to return to the menu, or exit to exit the program.





def event_type_options
  puts "We have the following event types upcoming:"
  puts "1. Hike"
  puts "2. Cleanup"
  puts "Which event type would you like to see upcoming events for?"
  @event_type_choice = gets.chomp
end

def day_of_week_options
  puts "Which day would you like to see upcoming events for?"
  puts "Monday"
  puts "Tuesday"
  puts "Wednesday"
  @day_choice = gets.chomp
end

def time_of_day_options
  puts "Which time would you like to see upcoming events for?"
  puts "Morning"
  puts "Afternoon"
  puts "Evening"
  @time_choice = gets.chomp
end

def list_all
  puts "Here is a list of all upcoming TreePeople events:"
  puts "1. Event1"
  puts "2. Event2"
  puts "Which event would you like to see details for?"
  @event_choice = gets.chomp
end
