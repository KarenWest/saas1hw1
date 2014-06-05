=begin
Karen West April 7th, 2013 - Homework #1 - Saas1 take2 - Question #5
 HW 1-5: Advanced OOP, Metaprogramming, Open Classes and Duck Typing

In lecture, we saw how attr_accessor uses metaprogramming to create getters and setters for object attributes on the fly.

Define a method attr_accessor_with_history that provides the same functionality as attr_accessor but also tracks every value the attribute has ever taken. The following example shows the basic behavior of the new accessor:

class Foo
    attr_accessor_with_history :bar
end

f = Foo.new     # => #<Foo:0x127e678>
f.bar = 3       # => 3
f.bar = :wowzo  # => :wowzo
f.bar = 'boo!'  # => 'boo!'
f.bar_history   # => [nil, 3, :wowzo, 'boo!']

Here are some hints and guidelines to get you rolling:

    The first thing to notice is that if we define attr_accessor_with_history in class Class, we can use it as in the snippet above. This is because, as ELLS mentions, a class in Ruby is simply an object of class Class. (If that makes your brain hurt, don't worry about it for now. It'll come eventually.)

    The second thing to notice is that Ruby provides a method class_eval that takes a string and evaluates it in the context of the current class, that is, the class from which you're calling attr_accessor_with_history. This string will need to contain a method definition that implements a setter-with-history for the desired attribute attr_name.

    #bar_history should always return an Array of elements, even if no values have been assigned yet.
Don't forget that the very first time the attribute receives a value, its history array will have to be initialized.

Don't forget that instance variables are referred to as @bar within getters and setters, as explained in Section 3.4 of ELLS.

Although the existing attr_accessor can handle multiple arguments (e.g. attr_accessor :foo, :bar), your version just needs to handle a single argument. However, it should be able to track multiple instance variables per class, with any legal class names or variable names, so it should work if used this way:

class SomeOtherClass
    attr_accessor_with_history :foo
    attr_accessor_with_history :bar
end

History of instance variables should be maintained separately for each object instance. That is, if you do

    f = Foo.new
    f.bar = 1
    f.bar = 2
    f = Foo.new
    f.bar = 4
    f.bar_history

    then the last line should return [nil, 4] rather than [nil, 1, 2, 4].

Here is the skeleton to get you started:

class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval "your code here, use %Q for multiline strings"
  end
end



class Person
end

Person.class_eval do
  def say_hello
   "Hello!"
  end
end

Karen = Person.new
Karen.say_hello # "Hello!" (changed from Jimmy - Jimmy Cuadra web site ex.)

In this example, class_eval allows us to define a method within the Person
class outside of its original definition and without reopening the class with
the standard syntax. This could be useful when the class you want to add
this method to is not known until runtime.
=end
=begin
class Class
  def initialize(new_class_name)
    @@class_name = Object.new("new_class_name")
    @@class_name.attr_accessor_with_history("")
  end
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create attr_name_history getter
    @@attr_name_history = {} #to start - then add to history with class_eval
    @@attr_name = ""
    def attr_name=(new_attr_name)
      @@attr_name = new_attr_name
    end
    class_eval do #to keep history use the @@ class var? use hash?
      attr_writer attr_name #attr_name instance writer definition
      attr_name_prev_list = @@attr_name_history[@@attr_name]
      attr_name_prev_list.concat([@attr_name])
      @@attr_name_history[@@attr_name] = attr_name_prev_list
    end
  end
end
=end
=begin
class_eval within def attr_accessor_with_history:
This string will need to contain a method definition that implements a
setter-with-history for the desired attribute attr_name.
=end

#starting again
=begin
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval "your code here, use %Q for multiline strings"
  end
  def initialize
    @new_attr_name = ""
    attr_accessor_with_history("")
  end
  def #{attr_name}=(value) #setter of attribute named attr_name and its history
    if (@new_attr_name == "")
      @#{attr_name}_history = [@#{attr_name}]
      @new_attr_name = @attr_name
    end
    @"#{attr_name}" = value
    @"#{attr_name}_history"<<value
  end
end
=end

#starting again!
=begin
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create attr_name_history getter
    if (@attr_name) == nil #setter of attr_name if not defined
        puts "making setter of attr_name" + attr_name
        @attr_name = attr_name
    else
        @attr_name
    end
    class_eval do #"your code here, use %Q for multiline strings"

    def attr_name=(value)
      @attr_name = value
      @attr_name_history<<value
    end
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
puts f
f.bar = 1
f.bar = 2
f.bar_history # => if your code works, should be [nil, 1, 2]
=end
#starting yet again with help from stack overflow!
class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s # make sure it's a string
        attr_reader attr_name
        attr_reader attr_name+"_history"
        class_eval %Q"
            def #{attr_name}=(value)
                if !defined? @#{attr_name}_history
                    @#{attr_name}_history = [@#{attr_name}]
                end
                @#{attr_name} = value
                @#{attr_name}_history << value
            end
        "
    end
end

class Foo
    attr_accessor_with_history :bar
end

class Foo2
    attr_accessor_with_history :bar
    def initialize()
        @bar = 'init'
    end
end

f = Foo.new
f.bar = 1
f.bar = nil
f.bar = '2'
f.bar = [1,nil,'2',:three]
f.bar = :three
puts "First bar:", f.bar.inspect, f.bar_history.inspect
puts "Correct?", f.bar_history == [f.class.new.bar, 1, nil, '2', [1,nil,'2',:three], :three] ? "yes" : "no"
old_bar_history = f.bar_history.inspect

f2 = Foo2.new
f2.bar = 'baz'
f2.bar = f2
puts "\nSecond bar:", f2.bar.inspect, f2.bar_history.inspect
puts "Correct?", f2.bar_history == [f2.class.new.bar, 'baz', f2] ? "yes" : "no"

puts "\nIs the old f.bar intact?", f.bar_history.inspect == old_bar_history ? "yes" : "no"

=begin
On Time
single attr_accessor_with_history
  should return nil as the first element [6 points]
  should record all past values of the variable, and be able to record for multiple instances [9 points]
  should record all past values of the variable, and be able to record for multiple variables [15 points]

multiple attr_accessor_with_history
  should return nil as the first element [14 points]
  should record all past values of the variable, and be able to record for multiple instances [21 points]
  should record all past values of the variable, and be able to record for multiple variables [35 points]

Finished in 0.04307 seconds
6 examples, 0 failures
=end
