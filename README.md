# oyster_card

This is the second week of Makers. We will create an oyster card system.

1. Setting up a Gemfile
  * construct a valid Gemfile - Done
  * specify a correct source for gems - Done
  * specify the latest Ruby version - Done
  * add the rspec gem to ‘test’ and ’development’ groups - Done
  * commit only this Gemfile - Done

2. Create RSpec conventional files
  * Generate conventional files (helper and config) for an RSpec project using a command-line option of the rspec executable file - Done (rspec --init)
  * Follow RSpec naming convention for files and folders - Done
  * Create a test file for the Oystercard class without any tests but with a describe block (doesn't exist yet) - Done (Test failed)

3. Learn debugging basics
  * Write down the type of error in the issue comments - Done (NameError)
  * Write down the file path where the error happened - Done (./spec/oyster_card_spec.rb)
  * Write down the line number of the error - Done (Line 1)
  * Use the Ruby Documentation to find out what the error means - Done (There is no class to initialise)
  * Suggest one way of solving the error - Done (Make the class)

4. Add the balance
  * Write up a plan for how you will interact with your code and manually test in IRB - Done
    ### Plan
    * Feature test 
    * Write unit test following the red green refactor cycle

  * Create a unit test for the Oystercard class - Done
  * Write a failing test that checks that a new card has a balance - Done
  * Write code that will make this test pass - Done
  * Now refactor by setting the balance in initialize using an instance variable - Done
  * Remove the balance method entirely and replace with an attr_reader - Done

5. Enable top up functionality 
 * Write up a plan for how you will interact with your code and manually test in IRB.
  ### Plan
  * Feature test - oystercard.top_up(arg)
  * Unit test - test for a top_up method with an argument
  * Unit test - check top_up is added to balance
 * Write a test for the top_up method - Done
 * Make sure the test fails before implementing the method - Done
 * Implement the method to make the test pass - Done

6. Enforce maximum balance
  * Write up a plan for how you will interact with your code and manually test in IRB.
    ### Plan
    * Feature test - oystercard.maximum_amount?
    * Unit test - test if the amount added by top up will exceed the maximum amount. Test for raised error.
  * Write a test that checks the top_up method throws an exception if the new balance would exceed the limit. - Done
  * Use a constant to store the limit - Done
  * Implement the limit in the top_up method. Use an inline if statement to check if the limit would be exceeded - Done
  * Make the error message include the limit value - Done
  * Use interpolation to keep your code DRY - Done

7. Deduct the money
 * Write up a plan for how you will interact with your code and manually test in IRB - Done
    ### Plan
    * Feature test - oystercard.deduct(arg)
    * Unit test - test for deduct method with an argument
    * Unit test - test amount is deducted from balance
 * Write a test for the deduct method, see it fail - Done
 * Implement the method, see the test pass - Done

8. Add touch in/out support
* Write up a plan for how you will interact with your code and manually test in IRB.
    ### Plan (Touch_in)
    * Feature test - oystercard.touch_in
    * Unit test - Check oystercard if the card is on a journey
    ### Plan (In_journey)
    * Feature test - oystercard.in_journey?
    * Unit test - Check if journey default is False
    ### Plan (Touch_out)
    * Feature test - oystercard.touch_out
    * Unit test - check if oystercard is not on a journey
* Write tests for in_journey?, touch_in and touch_out - Done
* Write implementation of these methods that will make the tests pass - Done
* Use an instance variable to track whether the card is in use - Done
* Use an RSpec predicate matcher to check if the card is in use - Done
* Use boolean values to store the state of the card - Done
 
 9. Checking minimum balance on touch in
* Write up a plan for how you will interact with your code and manually test in IRB - Done
  ### Plan
  * Feature test - oystercard.minimum_balance?
  * Unit test - check minimum balance on touch in 
  * Unit test - throw error if insufficient balance
* Write a test that checks that an error is thrown if a card with insufficient balance is touched in - Done
* Write the implementation - Done
* Update existing tests, if necessary, to make sure they still pass - Done
* Refactor to remove any magic numbers and replace with a constant - Done

10. Charging for the journey
 * Write up a plan for how you will interact with your code and manually test in IRB - Done
 ### Plan
  * Feature test - oystercard.touch_out decreases balance
  * Unit test - deduct method deduct minimum fare from balance
  * Unit test - deduct minimum fare when touched out
 * Write a test that uses expect {}.to change{}.by() syntax to check that a charge is made on touch out - Done
 * Update the touch_out method to make the test pass - Done
 * Make '#deduct' a private method - Done
 * Keep the code DRY - Done

 11. Saving the entry station
 * Write up a plan for how you will interact with your code and manually test in IRB - Done
 ### Plan
  * Feature test - oyster.touch_in to accept and remember the entry station. Oyster.touch_out to forget entry station
  * Unit test - touch_in to accept an entry station
  * Unit test - touch_out to forget an entry_staion

 * Refactor in_journey method to in_journey variable to infer status based on whether there is an entry station or not

12. Adding Journey History
 * ### Plan
  * Feature test - subject.touch_out(station) --> save entry&exit stations to history list
  * Feature test - method to return history list?
  * Unit test - touch_out to accept exit_station
  * Unit test - store listed journeys in instance variable, called with attr_accessor
  * Unit test - confirm one journey (entry & exit) can be stored in hash
  * Unit test - empty list of journeys before first journey (by default) (return nil)

13. Creating the station class
* Write up a plan for how you will interact with your code and manually test in IRB
### Plan
  * Feature test - station = Station.new(name, zone)
  * Unit test - create station - return zone or name
 Test drive the creation of a Station class that exposes a name and a zone variable
 Use only one expectation per test

14. Handling a journey without a touch out
### Plan
  * Feature test - new Journey class
  * read up on Extract Class
  * Move Journey specific methods to Journey class
  * Feature test - test a penalty fare (no touch in)
    card = OysterCard.new
    card.top_up(x)
    card.touch_out
  * Unit test above
  * repeat above for touch out

