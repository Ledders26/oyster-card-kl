require './lib/oyster_card'

describe OysterCard do

  it "should have a zero balance" do
    expect(subject.balance).to eq 0
  end 

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "should add top up amount to balance" do
      expect{ subject.top_up(10) }.to change { subject.balance }.from(0).to(10)
    end 

    it "should raise an error if top up will exceed maximum amount" do
      maximum_amount = OysterCard::MAXIMUM_AMOUNT
      subject.top_up(maximum_amount)
      expect{ subject.top_up(1) }.to raise_error("Exceeds Amount - adding 1 makes your #{subject.balance + 1} exceed #{OysterCard::MAXIMUM_AMOUNT}")
    end
  end

  describe "#touch_in" do

    it "should return penalty fare if there was no exit station" do
      subject.top_up(10)
      subject.touch_in(:station)
      expect{ subject.touch_in(:station) }.to change{ subject.balance }.by(-Journey::PENALTY_FARE)
    end

    it "should not touch in if there is insufficient balance" do
      expect{ subject.touch_in(:station) }.to raise_error("Insufficient balance")
    end

    it "should touch in if there is sufficient balance" do
      subject.top_up(1)
      expect { subject.touch_in(:station) }.not_to raise_error
    end 

  end

  describe "#touch_out" do

    it "should return penalty fare if there was no entry station" do
      subject.top_up(10)
      expect{ subject.touch_out(:station) }.to change{ subject.balance }.by(-Journey::PENALTY_FARE)
    end

    it "should deduct minimum fare from balance when touch in followed by touch out" do
      subject.top_up(1)
      subject.touch_in(:station)
      expect{ subject.touch_out(:station) }.to change{ subject.balance }.by(-OysterCard::MINIMUM_BALANCE)
    end 

    it "should forget the entry staion of the current journey" do
      subject.top_up(1)
      subject.touch_in(:station)
      expect(subject.touch_out(:station)).to eq nil
    end 

    it "should accept an exit station as argument when touching out" do
      subject.top_up(1)
      subject.touch_in(:station)
      expect(subject).to respond_to(:touch_out).with(1).argument
    end
  end
end