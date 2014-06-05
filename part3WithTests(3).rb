=begin
Karen West, April 8th, 2013
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
  # YOUR CODE HERE
  puts "starting combine_anagrams - input word list"
  puts words
  wordsCopy = words
  wordsSeen = []
  wordsWithSortedWord = {}
  wordArraySorted = []
  wordArray = []
  wordArrayLen = 0
  wordArraySorted = []
  wordStrSorted = nil
  arrayOfAnagramLists = []
  anagramList = []
  words.each do |word|
    if wordArray.include?(word) == false
      wordArray = word.split(//)
      wordArrayLen = wordArray.length
      if wordArrayLen >= 1:
        wordArraySorted = wordArray.sort
        wordStrSorted = wordArraySorted.join
        #puts wordStrSorted
        if (wordsWithSortedWord[wordStrSorted] == nil)
          #puts word
          wordsWithSortedWord[wordStrSorted] = word
          #anagramList = wordsWithSortedWord[wordStrSorted]
          #puts "anagramList at start"
          #puts anagramList
        else
          #puts word + " to add to anagram list with key:"
          #puts wordStrSorted
          #puts "anagramList being appended"
          #puts anagramList
          #puts word + " word to add to anagram list"
          anagramList = [wordsWithSortedWord[wordStrSorted]]
          anagramList.concat([word])
          wordsWithSortedWord[wordStrSorted] = anagramList
        end
      end
      wordsWithSortedWord.each_key do |wordStrSortedKey|
        #puts wordStrSortedKey + " sorted key"
        anagramList = wordsWithSortedWord[wordStrSortedKey]
        #puts "anagram list for sorted key"
        #puts anagramList
        arrayOfAnagramLists.concat([anagramList])
        #wordArray = wordStrSortedKey.split(//)
        #wordArrayLen = wordArray.length
      end
      else #anagram = 0 or 1 characters, and are allowed as valid anagrams
        anagramList = wordsWithSortedWord[word]
        arrayOfAnagramLists.concat([anagramList])
      end
    end
  end
  arrayOfAnagramLists.group_by{|anagramList| anagramList.length}
  #wordsGroupByAnagramLen = arrayOfAnagramLists.group_by(arrayOfAnagramLists,wordArrayLen)
  return arrayOfAnagramLists
end

=begin
Test:

Example test case:

# input: ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
# output: [ ["cars", "racs", "scar"],
#           ["four"],
#           ["for"],
#           ["potatoes"],
#           ["creams", "scream"] ]
=end
puts "combining anagrams"
puts "input: ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']"
puts "expected output: # output: [ ['cars', 'racs', 'scar'], ['four'], ['for'], ['potatoes'], ['creams', 'scream'] ]"
input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
anagrams = combine_anagrams(input)
puts "anagram list"
puts anagrams
puts "individual anagram lists"
anagrams.each do |anagramList|
  puts "anagram list"
  puts anagramList
end

puts "one char anagram"
input ["c", "f", "p", "r", "f"]
anagrams = combine_anagrams(input)
puts "anagram list"
puts anagrams
puts "individual anagram lists"
anagrams.each do |anagramList|
  puts "anagram list within list"
  puts anagramList

=begin
On Time
anagrams
  should handle an empty array [2 points]
  should handle the most simple, single-character case with no repeats [2 points] (FAILED)
  should handle the most simple, single-character case with capital letters but no repeats [2 points] (FAILED)
  should handle a set with no repeated anagrams and words with distinct letters [10 points] (FAILED)
  should handle a set with no repeated anagrams, but words with similar letters [2 points] (FAILED)
  should handle non-anagrams that have all but one letters the same [2 points] (FAILED)
  should handle a complicated case of some repeated anagrams, but no duplicates [25 points] (FAILED)
  should handle a complicated case of some repeated anagrams, but no duplicates [25 points] (FAILED)
  should handle a simple case of some repeated single-character inputs [2 points] (FAILED)
  should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points] (FAILED)
  should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points] (FAILED)
  should treat single-character capital letters as equal [2 points] (FAILED)
  should handle repeated single-character inputs, and treat captial letters as anagrams, while preserving case in the output [2 points] (FAILED)
  should treat two identical words with different cases as the same, and preserve case in output [2 points] (FAILED)
  should treat many identical words with different cases as the same, and preserve case in output [8 points] (FAILED)

Failures:

  1) anagrams should handle the most simple, single-character case with no repeats [2 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "a":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:95:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  2) anagrams should handle the most simple, single-character case with capital letters but no repeats [2 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "a":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:102:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  3) anagrams should handle a set with no repeated anagrams and words with distinct letters [10 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "this":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:109:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  4) anagrams should handle a set with no repeated anagrams, but words with similar letters [2 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "aabbcc":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:116:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  5) anagrams should handle non-anagrams that have all but one letters the same [2 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "reads":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:128:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  6) anagrams should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
     Failure/Error: self.map(&:sort)
     ArgumentError:
       comparison of Array with String failed
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `sort'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:135:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  7) anagrams should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
     Failure/Error: self.map(&:sort)
     ArgumentError:
       comparison of Array with String failed
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `sort'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:142:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  8) anagrams should handle a simple case of some repeated single-character inputs [2 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "c":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:149:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  9) anagrams should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
     Failure/Error: self.map(&:sort)
     ArgumentError:
       comparison of Array with String failed
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `sort'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:156:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  10) anagrams should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
     Failure/Error: self.map(&:sort)
     ArgumentError:
       comparison of Array with String failed
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `sort'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:163:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  11) anagrams should treat single-character capital letters as equal [2 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "a":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:169:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  12) anagrams should handle repeated single-character inputs, and treat captial letters as anagrams, while preserving case in the output [2 points]
     Failure/Error: result.should have(4).items
       expected 4 items, got 6
     # /tmp/rspec20130409-5509-2xniyf.rb:175:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  13) anagrams should treat two identical words with different cases as the same, and preserve case in output [2 points]
     Failure/Error: self.map(&:sort)
     NoMethodError:
       undefined method `sort' for "hello":String
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `map'
     # /tmp/rspec20130409-5509-2xniyf.rb:195:in `deepsort'
     # /tmp/rspec20130409-5509-2xniyf.rb:182:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

  14) anagrams should treat many identical words with different cases as the same, and preserve case in output [8 points]
     Failure/Error: result.should have(3).items
       expected 3 items, got 6
     # /tmp/rspec20130409-5509-2xniyf.rb:188:in `block (2 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:80:in `block (3 levels) in <top (required)>'
     # /tmp/rspec20130409-5509-2xniyf.rb:79:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:9:in `block (3 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_sandbox.rb:8:in `block (2 levels) in <top (required)>'
     # lib/graders/rspec_grader/rspec_runner.rb:42:in `block in run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:33:in `run_rspec'
     # lib/graders/rspec_grader/rspec_runner.rb:24:in `run'
     # lib/graders/rspec_grader/weighted_rspec_grader.rb:6:in `grade!'
     # ./grade:31:in `<main>'

Finished in 0.04722 seconds
15 examples, 14 failures

Failed examples:

rspec /tmp/rspec20130409-5509-2xniyf.rb:91 # anagrams should handle the most simple, single-character case with no repeats [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:98 # anagrams should handle the most simple, single-character case with capital letters but no repeats [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:105 # anagrams should handle a set with no repeated anagrams and words with distinct letters [10 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:112 # anagrams should handle a set with no repeated anagrams, but words with similar letters [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:124 # anagrams should handle non-anagrams that have all but one letters the same [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:131 # anagrams should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:138 # anagrams should handle a complicated case of some repeated anagrams, but no duplicates [25 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:145 # anagrams should handle a simple case of some repeated single-character inputs [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:152 # anagrams should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:159 # anagrams should handle a complicated case of some repeated anagrams, with duplicate inputs [7 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:166 # anagrams should treat single-character capital letters as equal [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:172 # anagrams should handle repeated single-character inputs, and treat captial letters as anagrams, while preserving case in the output [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:179 # anagrams should treat two identical words with different cases as the same, and preserve case in output [2 points]
rspec /tmp/rspec20130409-5509-2xniyf.rb:185 # anagrams should treat many identical words with different cases as the same, and preserve case in output [8 points]
=end
