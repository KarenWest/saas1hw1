=begin
Karen West, Homework #1, part 4, SaaS1, April 8th, 2013
 HW 1-4: Basic Object Oriented Programming

Part A: Create a class Dessert with getters and setters for name and calories. Define instance methods healthy?, which returns true if a dessert has less than 200 calories, and delicious? which returns true for all desserts.

Here is the framework:

class Dessert
    def initialize(name, calories)
        # Your code here
    end

    def healthy?
        # Your code here
    end

    def delicious?
        # Your code here
    end
end

Note: You may define additional helper methods.

Part B: Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. Modify delicious? to return false if the flavor is "black licorice" (but delicious? should still return true for all other flavors and for all non-JellyBean desserts).

The JellyBean class should look like this:

class JellyBean < Dessert
    def initialize(name, calories, flavor)
        # Your code here
    end

    def delicious?
        # Your code here
    end
end

Note: As before, you may define additional helper methods.

=end

class Dessert
  def initialize(name, calories)
    # YOUR CODE HERE
    @name = name
    @calories = calories
  end
=begin what attr_accessor method does --defines getters and setters
for instance variables in Ruby class
  def name
    @name #getter for name
  end
  def name= (newName)
    @name = newName #setter for name
  end
  def calories
    @calories #getter for calories
  end
  def calories= (newCalories)
    @calories = newCalories
  end
=end
  attr_accessor :name
  attr_accessor :calories


  def healthy?
    # YOUR CODE HERE
    if @calories < 200
      return true
    else
      return false
    end
  end

  def delicious?
    # YOUR CODE HERE
    #if class is Dessert, return true?
    #if (self =~ Dessert)
      #return true
    #else
      #return false
    #end
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
    @name = name
    @calories = calories
    @flavor = flavor
  end
  attr_accessor :flavor

  def delicious?
    # YOUR CODE HERE
    #if (@flavor != "black licorice") and (self =~ JellyBean)
    if (@flavor != "black licorice")
      return true
    else
      return false
    end
  end
end

=begin
    On Time
    dessert
      should be able to set and get a dessert's name and calories [20 points] (FAILED)
      should return true if a dessert has fewer than 200 calories [10 points]
      should return true for any dessert [20 points]

    jellybean
      should be a subclass of Dessert [10 points]
      should be able to set and get a jellybean's flavor [20 points] (FAILED)
      should return true unless the flavor is black licorice [20 points]

    Failures:

      1) dessert should be able to set and get a dessert's name and calories [20 points]
         Failure/Error: dessert.name.should eq( 'cake')
         NoMethodError:
           undefined method `name' for #<Dessert:0x00000002ece580 @name="cake", @calories=500>
         # /tmp/rspec20130409-5582-u8cicl.rb:105:in `block (2 levels) in <top (required)>'
         # /tmp/rspec20130409-5582-u8cicl.rb:98:in `block (3 levels) in <top (required)>'
         # /tmp/rspec20130409-5582-u8cicl.rb:97:in `block (2 levels) in <top (required)>'
         # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
         # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
         # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
         # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
         # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
         # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
         # ./grade:31:in `<main>'

      2) jellybean should be able to set and get a jellybean's flavor [20 points]
         Failure/Error: jellybean.flavor.should eq('strawberry')
         NoMethodError:
           undefined method `flavor' for #<JellyBean:0x00000002e35128>
         # /tmp/rspec20130409-5582-u8cicl.rb:133:in `block (2 levels) in <top (required)>'
         # /tmp/rspec20130409-5582-u8cicl.rb:98:in `block (3 levels) in <top (required)>'
         # /tmp/rspec20130409-5582-u8cicl.rb:97:in `block (2 levels) in <top (required)>'
         # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
         # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
         # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
         # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
         # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
         # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
         # ./grade:31:in `<main>'

    Finished in 0.00458 seconds
    6 examples, 2 failures

    Failed examples:

    rspec /tmp/rspec20130409-5582-u8cicl.rb:103 # dessert should be able to set and get a dessert's name and calories [20 points]
    rspec /tmp/rspec20130409-5582-u8cicl.rb:131 # jellybean should be able to set and get a jellybean's flavor [20 points]

=end

#my test:

dessert = Dessert.new("cookies", 150)
puts "are cookies healthy?"
puts dessert.healthy?
puts "are cookies delicious?"
puts dessert.delicious?
jellybeanDessert = JellyBean.new("jelly bean", 100, "black licorice")
puts "is black licorice healthy?"
puts jellybeanDessert.healthy?
puts "are black licorice jelly beans delicious?"
puts jellybeanDessert.delicious?
dessert = Dessert.new("lard", 1000)
puts "is lard healthy?"
puts dessert.healthy?
puts "is lard delicious?"
puts dessert.delicious?

=begin
On Time
dessert
  should be able to set and get a dessert's name and calories [20 points]
  should return true if a dessert has fewer than 200 calories [10 points]
  should return true for any dessert [20 points]

jellybean
  should be a subclass of Dessert [10 points]
  should be able to set and get a jellybean's flavor [20 points]
  should return true unless the flavor is black licorice [20 points]

Finished in 0.00394 seconds
6 examples, 0 failures
=end
