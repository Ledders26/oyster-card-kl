require './lib/journey'
require './lib/oyster_card'

describe Journey do
let(:oystercard) { OysterCard.new}

  it 'should store one journey in a hash' do
    oystercard.top_up(1)
    oystercard.touch_in(:station)
    oystercard.touch_out(:station)
    test_list = {:entry_station => :station, :exit_station => :station}
    expect(subject.journey_list(:station, :station)).to eq test_list
  end
  
  it 'should show empty journey list by default' do
    expect(subject.journeys).to eq nil
  end
end