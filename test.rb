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
	i_am_a_block.call
end

puts two_times_explicit
two_times_explicit {puts "Hello"}

#Reading and writing file
File.foreach( 'test.txt') do |line|
	puts line
	p line
	p line.chomp #chops off new line character
	p line.split # array of words in line
end
#handle exception
begin

	File.foreach('do_not_exist.txt') do |line|
		puts line.chomp
	end
rescue Exception => e
	puts e.message
	puts "Let's pretend this didn't happen..."
end
# or check if the file exists
if File.exist? 'test.txt'
	File.foreach('test.txt') do |line|
		puts line.chomp
	end
end

#writing to file. The file is automatically closed after the block executes
File.open("test1.txt", "w") do |file|
	file.puts "One line"
	file.puts "Another Line"
end

#Environment variable
puts ENV["PATH"]

#String - Interpolation only available for double-quoted strings
single_quoted = 'ice cream \n followed by it\'s a party'
double_quoted = "ice cream \n followed by it\'s a party"
puts single_quoted
puts double_quoted

def multiply (one, two)
	"#{one} multiplied by #{two} equals #{one * two}"
end
puts multiply(3,5)


# Use "%Q for string with multiple lines"
cur_weather = %Q{It's a hot day outside
				Grab your umbrellas}
#the method of string returns the copy of string if the method without "!". The method
# with "!" is destructive

my_name = " tim"
puts my_name.lstrip.capitalize
p my_name
my_name.lstrip!
p my_name

# Symbols - :foo - highly optimized strings-- stands for something string type

# guaranteed to be unique and immutable, can be converted between 

# method name is symbols... 


#Arrays - Heterogeneous types allowed in the same array
het_arr = [1, "two", :three]
arr_words = %w{ what a great day today!}
puts arr_words[-2]
p arr_words[2..4]
puts arr_words.join(',')

# Randomly pull elements out with sample
# sort or reverse with sort! and reverse! or sort, reverse
# You want a stack (LIFO)? 
stack = []; stack << "one"; stack.push("two")
puts stack.pop #two

# you need a queue (FIFO)?
queue = []; queue.push "one"; queue.push "two"
puts queue.shift # one

a = [5,3,4,2].sort!.reverse!
p a
p a.sample(2)
a[6] = 33
p a # [5,4,3,2,nil,nil,33]


#array method - each, select, reject, map...
 a = [1,3,4,7,8,10]
 a.each {|num| print num} #1347810
 #Ranges - natural consecutives sequences two dots -> all-inclusive therr dots -> end-exclusive
 # the more dots you have, the less you have at the end...  -only starore the start and end -- it's effeicent


 # can be converted to an array with to_a
 #used for condition and interval...
some_range = 1..3
puts some_range.max
puts some_range.include? 2
puts (1...10) === 5.3
age = 55
case age
 	when 0..12 then puts "Still a baby"
 	when 13..99 then puts "teenager"
 	else puts "OLD"
end

#Hash - like dictionary in pathon

# indexed collection for object references; also known as associative arrays 

editor_props = { "font" => "Arial", "size" => 12, "color" => "red"}
puts editor_props.length # 3
puts editor_props["font"] #Arial
editor_props["background"] = "Blue"
editor_props.each_pair do |key, value|
	puts "Key: #{key} Value: #{value}"
end
# when access a value in the hash for which an entry does not exist - nil is returned
# you can create the default with Hash.new(0)


word_frequency = Hash.new(0)
sentence = "Chicka chicka boom boom"
sentence.split.each do |word|
	word_frequency[word.downcase] += 1
end

p word_frequency 


# pass the hash as parameters
def adjust_colors (props = {foreground: "red", background: "white"})
	puts "Foreground: #{props[:foreground]}" if props[:foreground]
	puts "Background: #{props[:background]}" if props[:background]

end
adjust_colors
adjust_colors ({:foreground => "green"})
adjust_colors background: "yella" #this is the one I prefer
adjust_colors :background => "magenta"

#
#Block and Hash
a_hash = { :one => "one"}
puts a_hash
p a_hash


#puts{ :one => "one"} #syntax error, unexpected =>, expecting '}'

#workaround
puts ({ :one => "one"})
# OR
puts  :one => "one"


    





