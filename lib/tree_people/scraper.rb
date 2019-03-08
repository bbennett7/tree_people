class TreePeople::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.treepeople.org/calendar"))
  end

  def get_events
    self.get_events.css(.tr)
  end
end
