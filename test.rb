# Ruby notes - 09/12/2016 - Leslie Chenng's 60 Bday
puts 3
name = 'Fisher'

age = 21
case  # 1ST flavor
	when age >= 21
	  puts "You can buy a drink"
	when 1 == 0
	  puts "Written by a drunk programmer"
	else
	  puts "Default condition"
	
end
case name  # 2nd flavor 
  when /fish/i then puts "Something is fishy here"
  when 'Smith' then puts "Your name is Smith"
end  	

for i in 0..2 # hardly used each/times preferred
  puts i
end

#What's Splat Every function is really a method in a class
# No need to delare type of parmeters; can return whatever you want, return keyword is optional 
#- last exectued line returened
def simple
	puts "no parens"
end

def simple1()
	puts "yes parens"
end

def add(one, two)
	one + two
end
puts add(2,2)

def divide(one,two)
	return "I don't think so" if two == 0
	one/two
end
puts divide(2,0)
puts divide(12,4)


#Method Names can end with "?" - Predicate methods or '!'
def can_divide_by?(number)
	return false if number.zero?
	true
end
puts can_divide_by? 3
puts can_divide_by? 0

puts can_divide_by?8
puts can_divide_by?0

#Method can have default arguments 
#Ternary operator:condition? true:false

def factorial (n)
	n ==0? 1: n*factorial(n-1)

end

def factorial_with_default (n=5)
	n ==0? 1 : n * factorial_with_default(n-1)
end

puts factorial 5
puts factorial_with_default
puts factorial_with_default(3)


#Splat - not pointer pass all the paremeters as one, can be in the middle - can become a array


#block like iterator
1.times {puts "Hello World!"}
2.times do |index| #accepts parameters 
	if index >0
		puts index
	end
end

5.times {|index| puts index if index > 0}

# implicit way to call block in your own method

def two_times_implicit
	return "No block" unless block_given?
	yield
	yield
end

puts two_times_implicit {print "Hello"}
puts two_times_implicit


# Explicit way to call block

def two_times_explicit(&i_am_a_block)
	return "No block" if i_am_a_block.nil?
	i_am_a_block.call
    





