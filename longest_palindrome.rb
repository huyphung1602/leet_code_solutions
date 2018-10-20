# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
# Example 1:
# Input: "babad"
# Output: "bab"
# Note: "aba" is also a valid answer.
# Example 2:
# Input: "cbbd"
# Output: "bb"

# @param {String} s
# @return {String}

def is_palindrome?(s)
  a = s.split('')

  until a.size < 2
    return false if a.shift != a.pop
  end

  true
end

# Two pointer solution, O(n^2)
def longest_palindrome(s)
  return s if s == ''

  i = 0
  j = s.size - 1
  a = s.split('')
  result = a.first

  until i > s.size - 1
    if a[i] == a[j]
      sub_string = a.slice(i, j - i + 1).join('')
      result = sub_string if sub_string.size >= result.size && is_palindrome?(sub_string)
      j -= 1
    else
      j -= 1
    end

    if j <= i || j - i + 1 < result.size
      i += 1
      j = s.size - 1
    end
  end

  result
end

puts 'Test 1'
s = 'abcbad'
puts s
puts longest_palindrome(s)
puts

puts 'Test 2'
s = 'babad'
puts s
puts longest_palindrome(s)
puts

puts 'Test 3'
s = 'cbbd'
puts s
puts longest_palindrome(s)
puts

puts 'Test 4'
s = 'abbbbd'
puts s
puts longest_palindrome(s)
puts

puts 'Test 5'
s = 'abbbd'
puts s
puts longest_palindrome(s)
puts

puts 'Test 6'
s = ''
puts s
puts longest_palindrome(s)
puts

puts 'Test 7'
s = 'abadd'
puts s
puts longest_palindrome(s)
puts

puts 'Test 8'
s = 'kxuuisplqldxxqanojzyqlaycqwwrpczkymlbpoolybkbluvfkxzzxsoulnfhlhlqzibfhnbryhbkauxsuavnuqlinxrfdwgypsgjmilygtsqptbmfibcfkgdugljwpzjmwnqhtadraplrtlcxeqoniopzbemhkezvadjblpgmyuwlkwilipuccuqfvyzxtoathpnprqphtsiqjlocrmupngjnuskvbzadwxtxchsutumbvidxauotploicaqxegkstdfkyqbmegjhzdrqsuvrspqzbesgzwelrlejlilqvybdjyflbcziqlncddoohurovyuhfhjoyrkxbrvsepxbsivtrahz'
puts s
puts longest_palindrome(s)
puts

puts 'Test 9'
s = 'civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth'
puts s
puts longest_palindrome(s)
puts
