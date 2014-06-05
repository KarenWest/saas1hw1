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
     return value.round(3)
   else
     super
   end
 end
 def in(currency)
   singular_currency = currency.to_s.gsub( /s$/, "") #remove plural
   if @@currencies.has_key?(singular_currency) #have currency?
     value = self * @@currencies[singular_currency]
     return value.round(3)
   else
     super
   end
 end
end

module Enumerable
  def palindrome?()
    strOrArray = ""
    if self.is_a? Array
      strOrArray = self.join
    end
    strOrArray = strOrArray.downcase
    newstr = strOrArray
    revStr = ""
    revStr = strOrArray.reverse
    if (newstr == newstr)
      return true
    else
      return false
    end
  end
end


class String
  def palindrome?()
    strOrArray = ""
    strOrArray = self
    strOrArray = strOrArray.downcase #for regexp - use /W (anything NOT [a-z][A-Z][0-9])
    #remove all punctuation from string
    newstr = strOrArray.gsub(/[ !:;'?,. -- _0123456789]/,'')
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

=end
