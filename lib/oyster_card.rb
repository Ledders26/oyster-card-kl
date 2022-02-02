
class OysterCard
  attr_reader :balance
  attr_accessor :entry_station
  attr_accessor :exit_station

  MINIMUM_BALANCE = 1
  MAXIMUM_AMOUNT = 90

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil 
  end 

  def top_up(amount)
    raise "Exceeds Amount - adding #{amount} makes your #{@balance + amount} exceed #{MAXIMUM_AMOUNT}" if balance + amount > MAXIMUM_AMOUNT
    @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient balance" if balance < MINIMUM_BALANCE
    @entry_station = entry_station 
  end

  def in_journey? 
    @entry_station != nil
    # !!entry_station
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    deduct(MINIMUM_BALANCE)
    # saves entry and exit station information
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end 