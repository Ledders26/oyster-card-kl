class Station

  attr_accessor :station_name
  attr_accessor :zone

  def initialize(station_name, zone)
    @station_name = station_name
    @zone = zone
  end
end 