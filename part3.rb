=begin
Karen West, July 19th, 2013 (Saas1, take 3)
 HW 1-3: Anagrams

An anagram is a word obtained by rearranging the letters of another word. For example, "rats", "tars", and "star" are anagrams of one another, as are "dictionary" and "indicatory". We will call any array of single-word anagrams an anagram group. For instance, ["rats", "tars", "star"] is an anagram group, as is ["dictionary"].

Write a method combine_anagrams(words) that, given an array of strings words, groups the input words into anagram groups. Case doesn't matter in classifying strings as anagrams (but case should be preserved in the output), and the order of the anagrams in the groups doesn't matter. The output should be an array of anagram groups (i.e. an array of arrays).

Code skeleton:

def combine_anagrams(words)
    # your code here
end

Example test case:

# input: ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
# output: [ ["cars", "racs", "scar"],
#           ["four"],
#           ["for"],
#           ["potatoes"],
#           ["creams", "scream"] ]

Hint: You can quickly tell if two words are anagrams by sorting their letters, keeping in mind that upper vs. lowercase doesn't matter.

=end

def combine_anagrams(words)
  output_array = Array.new(0)
  words.each do |w1|
    temp_array = []
    words.each do |w2|
      if (w2.downcase.split(//).sort == w1.downcase.split(//).sort)
        temp_array.push(w2)
      end
    end
    output_array.push(temp_array)
  end
  return output_array.uniq
end

=begin
On Time
anagrams
  should handle an empty array [2 points]
  should handle the most simple, single-character case with no repeats [2 points]
  should handle the most simple, single-character case with capital letters but no repeats [2 points]
  should handle a set with no repeated anagrams and words with distinct letters [10 points]
  should handle a set with no repeated anagrams, but words with similar letters [2 points]
  should handle non-anagrams that have all but one letters the same [2 points]
  should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
  should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
  should handle a simple case of some repeated single-character inputs [2 points]
  should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
  should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
  should treat single-character capital letters as equal [2 points]
  should handle repeated single-character inputs, and treat captial letters as anagrams, while preserving case in the output [2 points]
  should treat two identical words with different cases as the same, and preserve case in output [2 points]
  should treat many identical words with different cases as the same, and preserve case in output [8 points]

Finished in 0.05006 seconds
15 examples, 0 failures
=end

