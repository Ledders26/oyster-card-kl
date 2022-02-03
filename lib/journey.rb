class Journey

  attr_reader :journey_list

  def initialize
    @journey_list = nil
  end

  def in_journey? 
    @entry_station != nil
    # !!entry_station
  end

  def journey_list(entry, exit)
    journey = {}
    journey[:entry_station] = entry
    journey[:exit_station] = exit
    @journey_list = journey
  end
end