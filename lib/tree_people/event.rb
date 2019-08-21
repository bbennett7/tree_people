class Event
  attr_accessor :number, :month, :date, :name, :location, :day, :start_time, :end_time, :time_of_day, :category, :url, :description, :spots_open

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  # find all events that happen after a passed in day (ex:25)

  # find all events that hapen before a certain time (12:00 PM)
  def self.before_time(time)
    time_integer = Time.parse(time).to_i
    @@all.select do |event|
      start_time_integer = Time.parse(event.start_time).to_i
      start_time_integer < time_integer
    end
  end

end
