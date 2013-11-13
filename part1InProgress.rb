#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.
  #don't use loops or iteration - use regular expressions
  #first, convert string to just characters, stripping out punctuation,
  #and converting to lower case characters
  #To solve recursively:
  #--Base case: a string of 0 or 1 characters is a palindrome
  #--Recursive case: if 1st character matches last character,
  #then is a palindrome if middle section is palindrome.
  #A divide and conquer algorithm.
  #Divide hard problem into set of sub-problems such that:
  #--sub-problems are easier to solve than original problem and
  #--Solutions to subproblems can be combined to solve the original problem.

def palindrome?(str)
  # YOUR CODE HERE
  str = str.downcase #for regexp - use [a-z] so no punctuation will match
  str = str.gsub(/[a-z]/, '') #remove anything but [a-z] chars from str
  revStr = ""
  revStr = str.reverse
  if (str.casecmp(revStr))
      return true
  else
      return false
  end
end
=begin
def palindrome?(str)
  # YOUR CODE HERE
  #don't use loops or iteration - use regular expressions
  #first, convert string to just characters, stripping out punctuation,
  #and converting to lower case characters
  #To solve recursively:
  #--Base case: a string of 0 or 1 characters is a palindrome
  #--Recursive case: if 1st character matches last character,
  #then is a palindrome if middle section is palindrome.
  #A divide and conquer algorithm.
  #Divide hard problem into set of sub-problems such that:
  #--sub-problems are easier to solve than original problem and
  #--Solutions to subproblems can be combined to solve the original problem.
  def toChars(str)
      str = str.downcase #for regexp - use [a-z] so no punctuation will match
      str = str.gsub(/[a-z]/, '') #remove anything but [a-z] chars from str
      return str
  end
  def isPalRecursive(str)
      #a str with length 1 char is a palindrome
      if str.length <= 1
          return True
      else
          #recursive divide and conquer to check for palindrome:
          #str[0] == str[-1] checks to see if 1st and last char are same
          #do recursion - call isPal() with char that follows 1st and char
          #before last char (arg is all but 1st and last char passed to isPal())
          # result anded together to get the final boolean answer
          strLen = str.length
          #return str[0] == str[strLen - 1] and isPalRecursive(str[1..(strLen-1)])
      end
  end

  def isPalReverseStr(str)
      revStr = ""
      revStr = str.reverse
      if (revStr == str)
          return True
      else
          return False
      end
  end
  return isPalReverseStr(toChars(str))
  #return isPalRecursive(toChars(str))
end
=end
#testStr = "A man, a plan, a canal -- Panama"
#print "is " + testStr + " a palindrome?"
#print palindrome?(testStr)
#testStr =  "Madam, I'm Adam!"
#print "is " + testStr + " a palindrome?"
#print palindrome?(testStr)
#testStr =  "Abracadabra"
#print "is " + testStr + " a palindrome?"
#print palindrome?(testStr)
=begin
def count_words(str)
  # YOUR CODE HERE
  wordCount = {}
  #split string words separated by space
  strList = str.split
  #then count number of words and put into hash with the word as key
  #and number of times it occurred as the value of that hash key
  strList.each do |word|
      wordCount[word] = strList.count(word)
  end
end
=end

#the code below this line will test your functions.  You should remove everything below this line prior to submitting your file


test_str = "there goes the neighborhood"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "Madam, I'm Adam"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

=begin
test_str = "The rent is due on the first day of the month unless the first day of the month falls on a Saturday or Sunday"

word_count = count_words test_str
puts word_count
=end
