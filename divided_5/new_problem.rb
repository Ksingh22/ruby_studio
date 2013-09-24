class Division
attr_accessor :num1, :num2

def initialize(num1,num2)
  @num1 = num1
  @num2 = num2
 
end
def to_s
  "\n Numbers can be divided by 5 wth zero remainder in range of #{divisable_5}"

end

 def divisable_5
nums = (num1..num2)
puts "divisable_5:"
nums.each do |i|
  
if i % 5 == 0
    print i, " "
end

end

end
end
if __FILE__ == $0
 remainder1 = Division.new(5, 15)
 puts remainder1

end
