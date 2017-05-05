=begin
1. Use `#puts` to output the string "Hi! I'm HAL, what's your name?"
2. Use the `#gets.strip` method to store the user's input and set it equal to a variable called `name`.
3. Call the `#greeting` method with an argument of the user's name (captured using `#gets` in step 2) to output the interpolated welcome string.
# code the #greeting method here!
=end

def greeting(name)
  puts "Hello #{name}. It's nice to meet you."
end
