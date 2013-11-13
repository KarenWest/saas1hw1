=begin
Karen West, Homework #1, part 4, SaaS1,Take3, July 19th, 2013
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
  should be able to set and get a dessert's name and calories [20 points]
  should return true if a dessert has fewer than 200 calories [10 points]
  should return true for any dessert [20 points]

jellybean
  should be a subclass of Dessert [10 points]
  should be able to set and get a jellybean's flavor [20 points]
  should return true unless the flavor is black licorice [20 points]

Finished in 0.00403 seconds
6 examples, 0 failures
=end

