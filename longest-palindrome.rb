# Windowing Longest Palindrome Algorithm
# Created by Colin Teahan
# April 8th, 2016

# This file consists of two methods:
#    1) longest_palindrome(string) -> returns longest palindrome
#    2) is_palindrome?(string)     -> returns true / false if palindrome

# This program will find the longest palindrome (ignoring spaces & case) in a
# string by checking every possible sub-string using a window-shifting algorithm,
# which checks the largest sub-size possible (including the original full 
# string), then decreasing the search window size by one and checking
# every possible position of that window till a palindrome is found
# or till the search window size is '1' and no palindromes exist.



def longest_palindrome(input)
  string = input.gsub(" ","")                           # removes spaces
  string.downcase!                                      # convert to lowercase
  return input if is_palindrome?(input)                 # check if input is palindrome
  length = string.length                                # get string length
  search = length - 1                                   # search window size
  while search > 1                                      # check all sub-string lengths down to 1
    for i in 0..(length-search)                         # check every window size
      sub_string = string[i..(search+i)]                # create substring from search window
      return sub_string if is_palindrome?(sub_string)   # return first found palindrome
    end
    search -= 1                                         # decrease window size
  end
  return false                                          # return false if no palindromes
end


def is_palindrome?(string)
  return false if string.length < 2                     # check string size
  array = string.chars                                  # string character array
  n = array.length-1                                    # last string character
  for i in 0...n
    return false if array[i] != array[n-i]              # check if string is mirror image
  end
  return true                                           # palindrome if all tests passed
end



# test case if you wanna try:
print longest_palindrome("Race Car")

# Theoretically, this should be the fastest possible way to find big 
# palindromes because it will exit at the biggest possible palindrome,
# but of course as if everything in computer science, it all depends
# on your input.

# Anyways, do with it what you will...
# Feel free to help make improvements ;)

# ~ Asleepace
