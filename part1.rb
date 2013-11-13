#Karen West - Homework #1 - Intro. To Saas1 Take 3 - July 19th, 2013
#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.

#don't use loops or iteration - use regular expressions
#first, convert string to just characters, stripping out punctuation,
#and converting to lower case characters

#" !@#$%^&*()-_+={}[]|\\:;'<>?,./\"" --all but the numerics below
#PUNCTUATION = " !@#$%^&*()-_+={}[]|\\:;'<>?,./\""
#PUNCTUATION = " !:;'?,."
#PUNCTUATION_NUMERICS_SPACE = PUNCTUATION + "0123456789"
#PUNCTUATION_ONLY = string.punctuation

def palindrome?(str)
  # YOUR CODE HERE
  str = str.downcase #for regexp - use /W (anything NOT [a-z][A-Z][0-9])
  #remove all punctuation from string
  newstr = str.gsub(/[ !:;'?,. -- _0123456789]/,'')
  revStr = ""
  revStr = newstr.reverse
  if (newstr == revStr)
      return true
  else
      return false
  end
end

def count_words(str)
  # YOUR CODE HERE
  wordCount = {}
  str = str.downcase
  #split string words separated by space
  strList = str.split(/\b/)
  strList.each do |word|
    word = word.gsub(/[ !:;'?,. -- _0123456789]/,'')
    #then count number of words and put into hash with the word as key
    #and number of times it occurred as the value of that hash key
    if (word != '')
        wordCount[word] = strList.count(word)
    end
  end
  return wordCount
end

=begin
On Time
#palindrome?
  should be defined
  recognizes palindromes correctly [25 points]
  recognizes non palindromes correctly [25 points]

#count_words
  should be defined
  should return a Hash
  counts the words properly [40 points]
  is not sensitive to case [10 points]

Finished in 0.077 seconds
7 examples, 0 failures
=end
