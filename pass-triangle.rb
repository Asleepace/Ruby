
class Node
  
  # tree
  @@data = []
  
  # read file from command line argument and turn into array of array's
  File.open(gets.chomp,"r"){|fp| fp.each_line {|ln| @@data << ln.split(" ")}}
  
  # create a new node 
  attr_accessor :val, :left, :rite 
  def initialize(row=0, col=0) 
    return nil if row == @@data.count || col == @@data[row].count 
    @left = Node.new(row + 1, col + 0) # left child
    @rite = Node.new(row + 1, col + 1) # rite child
    @val  = @@data[row][col].to_i      # node value
  end
  
  # max value
  def max(node)
    return 0 if node == nil || node.val == nil  # base case
    lmax = left.max(self.left)                  # left side maximum
    rmax = rite.max(self.rite)                  # rite side maximum
    max =  lmax < rmax ? rmax : lmax            # current maximum
    return self.val + max                       # add val + max
  end
  
  # helper method to call max on self
  def maximum(); return max(self); end
  
end



# test cases -------------- !


node = Node.new(0)

puts node.maximum