class Journey

  attr_reader :journeys

  def initialize
    @journeys = nil
  end

  def journey_list(entry, exit)
    journey = {}
    journey[:entry_station] = entry
    journey[:exit_station] = exit
    @journeys = journey
  end
end