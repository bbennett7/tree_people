class Event
  attr_accessor :number, :month, :date, :name, :location, :day, :start_time, :end_time, :time_of_day, :category, :url, :description, :spots_open

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
