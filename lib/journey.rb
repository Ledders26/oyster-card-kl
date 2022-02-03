class Journey

  attr_reader :journeys

  def initialize
    @journeys = nil
  end

  def journey_list(entry, exit)
    @journeys = {:entry_station => entry, :exit_station => exit}
  end
end