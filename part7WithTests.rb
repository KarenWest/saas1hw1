# -*- coding: utf-8 -*-
=begin
Karen West - Saas1 - homework#1 question #7 - April 7th, 2013
HW 1-7: Iterators, Blocks, Yield

Given two collections (of possibly different lengths), we want to get the Cartesian product of the sequences. A Cartesian product is a sequence that enumerates every possible pair from the two collections, where the pair consists of one element from each collection. For example, the Cartesian product (denoted by ×) of the sequences a = [:a, :b, :c] and b = [4, 5] is:

a × b = [ [:a,4], [:a,5], [:b,4], [:b,5], [:c,4], [:c,5] ]

Create a constructor for the class CartesianProduct that that takes two sequences as arguments, these values will define the behavior of your object. Define each as an
instance method for CartesianProduct. Your method should return an iterator which yields the cartesian product of the two sequences used in the class' constructor. The iterator should yield the values one at a time as 2 element arrays.

It doesn't matter what order the elements are returned in. So for the above example, the ordering [ [:a,4], [:b,4], [:c,4], [:a,5], [:b,5], [:c,5] ] would be correct as well.

It does matter that within each pair, the order of the elements matches the order in which the original sequences were provided. That is, [:a,4] is a member of the Cartesian product a × b but [4,:a] is not. (Instead, [4,:a] is a member of the Cartesian product b × a.)

Below is the code skeleton:
class CartesianProduct
    include Enumerable
    # Your code here
end

Example test cases:

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty

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

class CartesianProduct
  include Enumerable
  # YOUR CODE HERE
  def initialize(seq1, seq2)
    #puts "Enumerable initialize"
    #puts "seq1"
    #puts seq1
    #puts "seq2"
    #puts seq2
    @seq1 = seq1
    @seq2 = seq2
  end
  def each()
    puts "CartesionProduct.each()"
    #puts @seq1
    #puts @seq2
    @seq1.each do |elt1|
      #puts "elt1"
      #puts elt1
      @seq2.each do |elt2|
        #puts "elt2"
        #puts elt2
        #puts "yielding"
        #puts elt1
        #puts elt2
        yield [elt1,elt2]
      end
    end
  end
end
=begin
Risa's comments:
--don't put code in Enumerable - all goes in CartesionProduct
--use "each" method -- with INSTANCE method syntax
--good references:
--codecademy.com
--try ruby and ruby monk
--Matt Hartl RoR --another reference
=end
#Example test cases:

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# Nothing printed since Cartesian product of anything with an empty collection is empty
#For example, the Cartesian product (denoted by ×) of the sequences a = [:a, :b, :c] and b = [4, 5] is:

#a × b = [ [:a,4], [:a,5], [:b,4], [:b,5], [:c,4], [:c,5] ]
c = CartesianProduct.new([:a,:b, :c], [4,5])
c.each { |elt| puts elt.inspect }




