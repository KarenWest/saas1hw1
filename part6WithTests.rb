# -*- coding: utf-8 -*-

=begin
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

=end
class Numeric
 @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
 def method_missing(method_id)
   singular_currency = method_id.to_s.gsub( /s$/, '') #remove plural
   if @@currencies.has_key?(singular_currency) #have currency?
     if (method_id == 'dollar') #self = numeric number, method_id = currency
       value = self * @@currencies[singular_currency] #currency value in dollars
     else #if currency is not dollar first time through
       value = self / @@currencies[singular_currency] #numeric/currency conv.
     end
     #NEED TO OUTPUT value in at most 3 decimal places !!!
     #puts "currency"
     #puts singular_currency
     #puts "times"
     #puts self
     #puts "equals"
     #puts value
     #value = sprintf("%.3f",value)
     return value.round(3)
   else
     #puts "calling super class"
     super
   end
 end
 def in(currency)
   #puts "in calling method_missing with currency"
   #puts currency
   singular_currency = currency.to_s.gsub( /s$/, "") #remove plural
   if @@currencies.has_key?(singular_currency) #have currency?
     value = self * @@currencies[singular_currency]
     #NEED TO OUTPUT value in at most 3 decimal places !!!
     #puts value
     #value = sprintf("%.3f",value)
     return value.round(3)
   else
     super
   end
 end
end
puts "5 dollars in euros is "
puts 5.dollars.in(:euros)
puts "10 euros in rupees is "
puts 10.euros.in(:rupees)

# convert list to string -- do not need to use yield here
module Enumerable
  def palindrome?()
    strOrArray = ""
    if self.is_a? Array
      #puts "Array type"
      #puts self
      strOrArray = self.join
    end
    strOrArray = strOrArray.downcase
    #puts "after converting list(array)->string"
    #puts strOrArray
    #remove all punctuation from string
    #newstr = strOrArray.gsub(/[ !:;'?,. -- _0123456789]/,'')
    newstr = strOrArray
    revStr = ""
    revStr = strOrArray.reverse
    #puts "newstr"
    #puts newstr
    #puts "revStr"
    #puts revStr
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

=end


