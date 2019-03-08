require "pry"
require "nokogiri"
require "open-uri"

require "./lib/tree_people/event"

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.treepeople.org/calendar"))
  end

  def get_odd_events
    self.get_page.css(".views-table").css(".odd")
  end

  def get_even_events
    self.get_page.css(".views-table").css(".even")
  end

  def make_events
    counter = 0
    odd_number = 1
    self.get_odd_events.each do |event|
      event = Event.new
      event.month = get_page.css(".views-table").css("caption").text.strip
      event.date = get_odd_events.css(".views-field-field-date-2").css(".date-display-single")[counter].text.strip
      event.name = get_odd_events.css(".views-field-title").css("a")[counter].text.strip
      event.location = get_odd_events.css(".views-field-field-neighborhood")[counter].text.strip
      event.day = get_odd_events.css(".views-field-field-day-of-week")[counter].text.strip
      event.start_time = get_odd_events.css(".date-display-start")[counter].text.strip
      event.end_time = get_odd_events.css(".date-display-end")[counter].text.strip
      event.type = get_odd_events.css(".views-field-field-event-category")[counter].text.strip
      event.number = odd_number
      counter += 1
      odd_number += 2
    end

      ev_counter = 0
      even_number = 2
      self.get_even_events.each do |event|
        event = Event.new
        event.month = get_page.css(".views-table").css("caption").text.strip
        event.date = get_even_events.css(".views-field-field-date-2").css(".date-display-single")[ev_counter].text.strip
        event.name = get_even_events.css(".views-field-title").css("a")[ev_counter].text.strip
        event.location = get_even_events.css(".views-field-field-neighborhood")[ev_counter].text.strip
        event.day = get_even_events.css(".views-field-field-day-of-week")[ev_counter].text.strip
        event.start_time = get_even_events.css(".date-display-start")[ev_counter].text.strip
        event.end_time = get_even_events.css(".date-display-end")[ev_counter].text.strip
        event.type = get_even_events.css(".views-field-field-event-category")[ev_counter].text.strip
        event.number = even_number
        ev_counter += 1
        even_number += 2
      end
      Event.all.sort_by!{|event| event.number}
    end

  def print_events
    self.make_events
    Event.all.each do |event|
      puts "#{event.day}, #{event.month} #{event.date}, from #{event.start_time} to #{event.end_time} - #{event.name} in #{event.location} - #{event.type}"
    end
  end
end
