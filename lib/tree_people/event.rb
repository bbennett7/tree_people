class Event
  attr_accessor :month, :date, :name, :location, :day, :start_time, :end_time, :type, :number

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
