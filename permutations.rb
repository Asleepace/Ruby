
# Array to hold permutations
$permutations = []

# Recursive method to permutate string
def permutate(string, substring="")
    if string.length == 2 
       $permutations.push(substring + string)
       $permutations.push(substring + string.reverse)
    end
    string.chars.each do |char|
        permutate(string.sub(char,""),(substring + char)) 
    end
end

# Example use of method
permutate("Asleepace")

# Print sorted output
$permutations.sort!
puts $permutations
