# code the #greeting method here!


def greeting(name)
puts "Hello #{name}. It's nice to meet you."
end

puts "Hi! I'm HAL, what's your name?"
#The gets method is throwing an error ???
name = gets.chomp
greeting(name)
