class Journey

  attr_reader :journey_list

  def initialize
    @journey_list = nil
  end

  def in_journey? 
    @entry_station != nil
    # !!entry_station
  end

  def journey_list
    journey = {}
    journey[:entry_station] = @entry_station
    journey[:exit_station] = @exit_station
    @journey_list = journey
  end
end