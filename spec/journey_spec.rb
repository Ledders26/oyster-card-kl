require './lib/journey'

describe Journey do
let (:station) { double(:station) }
#let(:oystercard) { OysterCard.new }

  describe '#journey_list' do

    it 'should store one journey in a hash' do
      subject.start_journey(:station)
      subject.end_journey(:station)
      subject.journey_list
      test_list = {:entry_station => :station, :exit_station => :station}
      expect(subject.journeys).to eq test_list
    end
    
    it 'should show empty journey list by default' do
      expect(subject.journeys).to eq nil
    end
  end

  describe '#start_journey' do
    it 'should update entry station to equal station passed' do
      subject.start_journey("Victoria")
      expect(subject.entry_station).to eq "Victoria"
    end

    it "should show in journey to be true after a journey starts" do
      subject.start_journey(:station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#end_journey' do
    it 'should update exit station to equal station passed' do
      subject.end_journey("Bank")
      expect(subject.exit_station).to eq "Bank"
    end

    it "should show in journey to be false after a journey ends" do
      subject.end_journey(:station)
      expect(subject.in_journey?).to eq false
    end
  end

  describe "#in_journey?" do
    it "should show in journey to be false when card has not touched in" do
      expect(subject).not_to be_in_journey
    end 

  end
end