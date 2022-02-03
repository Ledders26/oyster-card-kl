require 'journey'

describe Journey do

  describe "#in_journey?" do
    it "should show in journey to be false when card has not touched in" do
      expect(subject).not_to be_in_journey
    end 
  end

  it 'should store the entry and exit station on touch out' do
    subject.top_up(1)
    subject.touch_in(:station)
    subject.touch_out(:station)
    expect(subject.exit_station).to eq :station
  end

  it 'should store one journey in a hash' do
    subject.top_up(1)
    subject.touch_in(:station)
    subject.touch_out(:station)
    test_list = {:entry_station => :station, :exit_station => :station}
    expect(subject.journey_list).to eq test_list
  end
  
  it 'should show empty journey list by default' do
    expect(subject.journey_list[:entry_station]).to eq nil
  end
end