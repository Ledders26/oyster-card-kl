require 'station'

describe Station do

  it "should create station name" do
    station = Station.new("Bank", 1)
    expect(station.station_name).to eq("Bank")
  end

  it "should create a zone" do
    station = Station.new("Bank", 1)
    expect(station.zone).to eq(1)
  end 
end 