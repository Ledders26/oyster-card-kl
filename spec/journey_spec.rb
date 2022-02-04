require './lib/journey'

describe Journey do
let (:station) { double("Victoria") }
#let(:oystercard) { OysterCard.new }

  describe '#journey_list' do

    xit 'should store one journey in a hash' do
      oystercard = OysterCard.new
      # oystercard.top_up(1)
      # oystercard.touch_in(:station)
      # oystercard.touch_out(:station)
      test_list = {:entry_station => :station, :exit_station => :station}
      expect(oystercard.journey.journeys).to eq test_list
    end
    
    it 'should show empty journey list by default' do
      expect(subject.journeys).to eq nil
    end

    describe '#start_journey' do
      it 'should update entry station to equal station passed' do
        subject.start_journey("Victoria")
        expect(subject.entry_station).to eq "Victoria"
      end

    end
  end

  describe "#in_journey?" do
    it "should show in journey to be false when card has not touched in" do
      expect(subject).not_to be_in_journey
    end 

  end
end