# -*- coding: utf-8 -*-
=begin
Notes to myself from Skype conversation with Risa:
PartA: use class Numeric and add the "in" method
PartB: works
PartC: do not need to use the Yield function in Enumerable to solve
problem - can just convert list to string and then translate palindrome

Karen West - April 7th, 2013 - homework#1 question#6
HW 1-6: Advanced OOP, Metaprogramming, Open Classes and Duck Typing

Part A — Currency conversion (ELLS 3.11): Extend the currency-conversion
example from lecture so that code such as the following will work:

    5.dollars.in(:euros)
    10.euros.in(:rupees)


You should support the currencies dollars, euros, rupees, yen where the
conversions are:

    rupees to dollars, multiply by 0.019,
    yen to dollars, multiply by 0.013,
    euro to dollars, multiply by 1.292.

Both the singular and plural forms of each currency should be acceptable, e.g.
1.dollar.in(:rupees) and 10.rupees.in(:euro) should work.

You can use the code shown in lecture as a starting point if you wish. It is
repeated below:

class Numeric
 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '')
   if @@currencies.has_key?(singular_currency)
     self * @@currencies[singular_currency]
   else
     super
   end
 end
end


Part B — Palindromes: Adapt your solution from the "palindromes" question
so that instead of writing palindrome?("foo") you can write "foo".palindrome?
(Hint: this should require fewer than 5 lines of code.)

Part C — Palindromes again: Adapt your palindrome solution so that it works on
Enumerables. That is:
[1,2,3,2,1].palindrome? # => true

It's not necessary for the collection's elements to be palindromes themselves--only that the top-level collection be a palindrome. (Hint: this should require fewer than 5 lines of code.) Although hashes are considered Enumerables, your solution does not need to work with hashes, though it should not error.


class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

class String
  # YOUR CODE HERE
end

module Enumerable
  # YOUR CODE HERE
end

#Enumerable Example I followed in Fox and Patterson book:

# return every n'th element in an enumerable
module Enumerable
  def every_nth(count)
    index = 0
    self.each do |elt|
      yield elt if index % count == 0
      index += 1
    end
  end
end

list = (1..10).to_a # make an array from a range
list.every_nth(3) { |s| print "#{s}, " }
# => 1, 4, 7, 10,
list.every_nth(2) { |s| print "#{s}, " }
# => 1, 3, 5, 7, 9,
=end
#module Currency--found when searching for help--not my solution
require 'rubygems'

# This is allowing us to do the `pluralize` calls below
require 'active_support/inflector'
#Part A - Currency conversion
module Currency
  CONVERSION_TABLE = { dollars: { dollars: 1, euros: 0.75 }, euros: { dollars: 1.3333334, euros: 1 } }.freeze
  attr_accessor :currency

  def method_missing(method_name, *args, &block)
    # standardize on pluralized currency names internally so both singular
    # and plural methods are handled
    method_name = method_name.to_s.pluralize.to_sym

    # Use the "from" keys in the conversion table to verify this is a valid
    # source currency
    if CONVERSION_TABLE.key?(method_name)
      @currency = method_name
      self # return self so a call to `1.dollar` returns `1` and not `:dollars`
    else
      super
    end
  end

  # Convert `self` from type of `@currency` to type of `destination_currency`, mark the result with
  # the appropriate currency type, and return. Example:
  def to(destination_currency)
    # Again, standardize on plural currency names internally
    destination_currency = destination_currency.to_s.pluralize.to_sym

    # Do some sanity checking
    raise UnspecifiedSourceCurrency unless defined?(@currency)
    raise UnsupportedDestinationCurrency unless CONVERSION_TABLE.key?(destination_currency)

    # Do the actual conversion, and round for sanity, though a better
    # option would be to use BigDecimal which is more suited to handling money
    result = (self * CONVERSION_TABLE[@currency][destination_currency]).round(2)

    # note that this is setting @currency through the accessor that
    # was created by calling `attr_accessor :currency` above
    result.currency = destination_currency
    result
  end
end

class Numeric
  # Take all the functionality from Currency and mix it into Numeric
  #
  # Normally this would help us encapsulate, but right now it's just making
  # for cleaner reading. My original example contained more encapsulation
  # that avoided littering the Numeric clas, but it's harder for a beginner
  # to understand. For now, just start here and you will learn more later.
  include Currency
end

p 5.euros.to(:dollars)                #=> 6.67
p 0.25.dollars.to(:euro)              #=> 0.19
p 1.dollar.to(:euros).to(:dollar)     #=> 1.0

=begin
Part B — Palindromes: Adapt your solution from the "palindromes" question
so that instead of writing palindrome?("foo") you can write "foo".palindrome?
(Hint: this should require fewer than 5 lines of code.)

Part C — Palindromes again: Adapt your palindrome solution so that it works on
Enumerables. That is:
[1,2,3,2,1].palindrome? # => true

=end
# return every n'th element in an enumerable
module Enumerable
  def returnStr()
    puts "returnStr"
    puts self
    #@@str = ""
    self.each do |elt|
      puts "returnStr elt"
      puts elt
      #@@str << elt
      yield elt
      #puts "returning str"
      #return @@str
    end
  end
  def palindrome?()
    @strOrArray = ""
    if self.is_a? Array
      puts "Array type"
    end
    puts self
    self.returnStr { |char| @strOrArray << char }
    #strOrArray = strOrArray.downcase #for regexp - use /W (anything NOT [a-z][A-Z][0-9])
    puts "after calling returnStr enumerable list->string"
    puts @strOrArray
    if self.is_a? Array
      puts "Array type"
    end
    #remove all punctuation from string
    #newstr = strOrArray.gsub(/[ !:;'?,. -- _0123456789]/,'')
    newstr = @strOrArray
    revStr = ""
    revStr = @strOrArray.reverse
    puts "newstr"
    puts newstr
    puts "revStr"
    puts revStr
    if (newstr == newstr)
      return true
    else
      return false
    end
  end
end


class String
  def palindrome?()
    # YOUR CODE HERE
    #if (self.is_a? String)
      #strOrArray = ""
      #strOrArray = self
    #elsif (self.is_a? Array)
      #strOrArray = ""
      #strOrArray << self.returnStr
      #inputArray = []
      #inputArray = self
      #strOrArray = inputArray.join
    #end
    strOrArray = ""
    strOrArray = self
    strOrArray = strOrArray.downcase #for regexp - use /W (anything NOT [a-z][A-Z][0-9])
    puts strOrArray
    #remove all punctuation from string
    newstr = strOrArray.gsub(/[ !:;'?,. -- _0123456789]/,'')
    #newstr= strOrArray
    revStr = ""
    revStr = newstr.reverse
    if (newstr == revStr)
      return true
    else
      return false
    end
  end
end
=begin
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
=end
#the code below this line will test your functions.  You should remove everything below this line prior to submitting your file


test_str = "there goes the neighborhood"

if test_str.palindrome?
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "Madam, I'm Adam"

if test_str.palindrome?
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

test_str = "A man, a plan, a canal -- Panama"
if test_str.palindrome?
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

test_str =  "Abracadabra"
if test_str.palindrome?
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

test_list = [1,2,3,2,1]
if test_list.palindrome?
  puts test_list
  puts "is a palindrome!"
else
  puts test_list
  puts "is NOT a palindrome!"
end

=begin
On Time
Currency conversion
  correctly converts currency from rupees to dollars (singular) [2 points] (FAILED)
  correctly converts currency from yen to dollars (singular) [2 points] (FAILED)
  correctly converts currency from euro to dollars (singular) [2 points] (FAILED)
  correctly converts currency from rupees to dollars (plural) [3 points] (FAILED)
  correctly converts currency from yen to dollars (plural) [3 points] (FAILED)
  correctly converts currency from euro to dollars (plural) [3 points] (FAILED)
  correctly converts currency from rupees to yen, euros to rupees, yen to euros [15 points] (FAILED)

adapted palindrome?
  correctly identifies positive and negative palindromes [30 points] (FAILED)

enumerable palindrome?
  correctly identifies simple array positive palindromes [6 points] (FAILED)
  correctly identifies simple array non-palindromes [6 points] (FAILED)
  should not error on non-sensical cases of enumerables, like hashes [5 points] (FAILED)
  should still work for the case of non-array enumerables that do make sense, like iterators (valid palindrome) [15 points] (FAILED)
  should still work for non-array enumerables that do make sense (invalid palindromes) [8 points] (FAILED)

Failures:

  1) Currency conversion correctly converts currency from rupees to dollars (singular) [2 points]
     Failure/Error: super
     NoMethodError:
       undefined method `rupees' for 2:Fixnum
     # /tmp/rspec20130417-19381-gw2ftv.rb:121:in `method_missing'
     # /tmp/rspec20130417-19381-gw2ftv.rb:182:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  2) Currency conversion correctly converts currency from yen to dollars (singular) [2 points]
     Failure/Error: super
     NoMethodError:
       undefined method `yens' for 3:Fixnum
     # /tmp/rspec20130417-19381-gw2ftv.rb:121:in `method_missing'
     # /tmp/rspec20130417-19381-gw2ftv.rb:185:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  3) Currency conversion correctly converts currency from euro to dollars (singular) [2 points]
     Failure/Error: super
     NoMethodError:
       undefined method `ins' for 6:Fixnum
     # /tmp/rspec20130417-19381-gw2ftv.rb:121:in `method_missing'
     # /tmp/rspec20130417-19381-gw2ftv.rb:188:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  4) Currency conversion correctly converts currency from rupees to dollars (plural) [3 points]
     Failure/Error: super
     NoMethodError:
       undefined method `rupees' for 2:Fixnum
     # /tmp/rspec20130417-19381-gw2ftv.rb:121:in `method_missing'
     # /tmp/rspec20130417-19381-gw2ftv.rb:193:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  5) Currency conversion correctly converts currency from yen to dollars (plural) [3 points]
     Failure/Error: super
     NoMethodError:
       undefined method `yens' for 3:Fixnum
     # /tmp/rspec20130417-19381-gw2ftv.rb:121:in `method_missing'
     # /tmp/rspec20130417-19381-gw2ftv.rb:196:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  6) Currency conversion correctly converts currency from euro to dollars (plural) [3 points]
     Failure/Error: super
     NoMethodError:
       undefined method `ins' for 6:Fixnum
     # /tmp/rspec20130417-19381-gw2ftv.rb:121:in `method_missing'
     # /tmp/rspec20130417-19381-gw2ftv.rb:199:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  7) Currency conversion correctly converts currency from rupees to yen, euros to rupees, yen to euros [15 points]
     Failure/Error: super
     NoMethodError:
       undefined method `rupees' for 5:Fixnum
     # /tmp/rspec20130417-19381-gw2ftv.rb:121:in `method_missing'
     # /tmp/rspec20130417-19381-gw2ftv.rb:204:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  8) adapted palindrome? correctly identifies positive and negative palindromes [30 points]
     Failure/Error: "a man a plan a canal panama".palindrome?.should be_true
     NoMethodError:
       undefined method `palindrome?' for "a man a plan a canal panama":String
     # /tmp/rspec20130417-19381-gw2ftv.rb:213:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  9) enumerable palindrome? correctly identifies simple array positive palindromes [6 points]
     Failure/Error: ["a", "b", "c", "b", "a"].should be_a_palindrome
     NoMethodError:
       undefined method `palindrome?' for ["a", "b", "c", "b", "a"]:Array
     # /tmp/rspec20130417-19381-gw2ftv.rb:243:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  10) enumerable palindrome? correctly identifies simple array non-palindromes [6 points]
     Failure/Error: [1,2,3,4,3,2].should_not be_a_palindrome
     NoMethodError:
       undefined method `palindrome?' for [1, 2, 3, 4, 3, 2]:Array
     # /tmp/rspec20130417-19381-gw2ftv.rb:247:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  11) enumerable palindrome? should not error on non-sensical cases of enumerables, like hashes [5 points]
     Failure/Error: pvalue = {"hello"=> "world"}.palindrome?
     NoMethodError:
       undefined method `palindrome?' for {"hello"=>"world"}:Hash
     # /tmp/rspec20130417-19381-gw2ftv.rb:251:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  12) enumerable palindrome? should still work for the case of non-array enumerables that do make sense, like iterators (valid palindrome) [15 points]
     Failure/Error: ValidPalindromeTest.new(1,9).should be_a_palindrome
     NoMethodError:
       undefined method `palindrome?' for #<ValidPalindromeTest:0x0000000392ca90 @a=1, @b=9>
     # /tmp/rspec20130417-19381-gw2ftv.rb:258:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  13) enumerable palindrome? should still work for non-array enumerables that do make sense (invalid palindromes) [8 points]
     Failure/Error: (1..2).should_not be_a_palindrome
     NoMethodError:
       undefined method `palindrome?' for 1..2:Range
     # /tmp/rspec20130417-19381-gw2ftv.rb:263:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:167:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130417-19381-gw2ftv.rb:166:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

Finished in 0.00877 seconds
13 examples, 13 failures

Failed examples:

rspec /tmp/rspec20130417-19381-gw2ftv.rb:181 # Currency conversion correctly converts currency from rupees to dollars (singular) [2 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:184 # Currency conversion correctly converts currency from yen to dollars (singular) [2 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:187 # Currency conversion correctly converts currency from euro to dollars (singular) [2 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:192 # Currency conversion correctly converts currency from rupees to dollars (plural) [3 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:195 # Currency conversion correctly converts currency from yen to dollars (plural) [3 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:198 # Currency conversion correctly converts currency from euro to dollars (plural) [3 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:203 # Currency conversion correctly converts currency from rupees to yen, euros to rupees, yen to euros [15 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:212 # adapted palindrome? correctly identifies positive and negative palindromes [30 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:242 # enumerable palindrome? correctly identifies simple array positive palindromes [6 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:246 # enumerable palindrome? correctly identifies simple array non-palindromes [6 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:250 # enumerable palindrome? should not error on non-sensical cases of enumerables, like hashes [5 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:257 # enumerable palindrome? should still work for the case of non-array enumerables that do make sense, like iterators (valid palindrome) [15 points]
rspec /tmp/rspec20130417-19381-gw2ftv.rb:262 # enumerable palindrome? should still work for non-array enumerables that do make sense (invalid palindromes) [8 points]

=end
