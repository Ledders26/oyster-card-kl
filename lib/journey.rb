class Journey

  attr_reader :journeys
  attr_accessor :entry_station
  attr_accessor :exit_station

  PENALTY_FARE = 6

  def initialize
    @journeys = nil
    @entry_station = nil
    @exit_station = nil 
  end

  def journey_list
    @journeys = {:entry_station => @entry_station, :exit_station => @exit_station}
  end

  def start_journey(station)
    @entry_station = station
  end

  def end_journey(station)
    @exit_station = station
  end

  def in_journey? 
    @entry_station != nil
  end

  def fare
    journey_list
    entry_station == nil || exit_station == nil ? PENALTY_FARE : OysterCard::MINIMUM_BALANCE
  end

end