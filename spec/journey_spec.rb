require './lib/journey'
require './lib/oyster_card'

describe Journey do
let (:station) { double :station }
let(:oystercard) { OysterCard.new }

  describe '#journey_list' do
    it 'should store one journey in a hash' do
      oystercard.top_up(1)
      oystercard.touch_in(:station)
      oystercard.touch_out(:station)
      test_list = {:entry_station => :station, :exit_station => :station}
      expect(oystercard.journey.journeys).to eq test_list
    end
    
    it 'should show empty journey list by default' do
      expect(subject.journeys).to eq nil
    end
  end

  describe "#in_journey?" do
    it "should show in journey to be false when card has not touched in" do
      expect(subject).not_to be_in_journey
    end 

  end
end