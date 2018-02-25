# palindromic_strings_2.rb

# Write another method that returns true if the string passed as an argument
# is a palindrome, false otherwise. This time, however, your method should
# be case-insensitive, and it should ignore all non-alphanumeric characters.
# If you wish, you may simplify things by calling the palindrome? method you
# wrote in the previous exercise.


def real_palindrome?(input)
  string = input.downcase.delete('^a-z0-9')
  string == string.reverse
end


# Examples:
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false