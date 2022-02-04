require_relative 'journey'

class OysterCard
  attr_reader :balance
  attr_reader :journey

  MINIMUM_BALANCE = 1
  MAXIMUM_AMOUNT = 90


  def initialize
    @balance = 0
    @journey = Journey.new
  end 

  def top_up(amount)
    raise "Exceeds Amount - adding #{amount} makes your #{@balance + amount} exceed #{MAXIMUM_AMOUNT}" if balance + amount > MAXIMUM_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance" if balance < MINIMUM_BALANCE
    deduct(journey.fare) if journey.in_journey?
    journey.start_journey(station)
  end

  def touch_out(station)
    journey.end_journey(station)
    deduct(journey.fare)
    journey.entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
    journey.exit_station = nil
  end

end 