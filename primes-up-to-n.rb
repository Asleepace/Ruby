$primes = [2]
def is_prime?(number)
  return false if number % 2 == 0
  value  = 3
  finish = number ** 0.5
  while value <= finish
    return false if number % value == 0
    value += 2
  end
  return true
end
def primes(num)
  val = 3
  while val < num do
    $primes.push(val) if is_prime?(val) == true
    val += 2
  end
end
$input = []
File.open(ARGV.first.chomp,"r") do |file| 
  file.each_line do |line| 
    next if line == nil
    $input << line.chomp.to_i
  end
end
max_prime = $input.max_by { |v| v }
primes(max_prime)
$input.each do |n|
  index = 0
  while index <= ($primes.count-1) && $primes[index] < n
    print "," unless index == 0
    print $primes[index]
    index += 1
  end
  print "\n"
end
