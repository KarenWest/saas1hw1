#Karen West - Homework #1 - Intro. To SaaS 1 - Jan. 27th, 2013
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
  puts str + " init str lower case"
  #remove all punctuation from string
  newstr = str.gsub(/[ !:;'?,. -- _0123456789]/,'')
  puts newstr + " str with punctuation removed"
  revStr = ""
  revStr = newstr.reverse
  puts revStr + " string in reverse"
  puts newstr + " str"
  puts revStr + " reverse str"
  if (newstr == revStr)
      return true
  else
      return false
  end
end

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

test_str = "A man, a plan, a canal -- Panama"
if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

test_str =  "Abracadabra"
if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

def count_words(str)
  # YOUR CODE HERE
  wordCount = {}
  str = str.downcase
  #puts str
  #split string words separated by space
  strList = str.split(/\b/) # MOST LIKELY SHOULD ADD ignoring of white spaces, commas, dashes, here!!
  puts "strList before punctuation removal"
  puts strList
  strList.each do |word|
    word = word.gsub(/[ !:;'?,. -- _0123456789]/,'')
    #punctuation = /#{word}/.match(/[ !:;'?,. -- _0123456789]/,'') #ERROR HERE!!
    #then count number of words and put into hash with the word as key
    #and number of times it occurred as the value of that hash key
    if (word != '')
        wordCount[word] = strList.count(word)
    end
  end
  return wordCount
end


test_str = "The rent is due on the first day of the month unless the first day of the month falls on a Saturday or Sunday"

word_count = count_words test_str
puts word_count

test_str = "A man, a plan, a canal -- Panama"

word_count = count_words test_str
puts word_count

test_str = "Doo bee doo bee doo"

word_count = count_words test_str
puts word_count
