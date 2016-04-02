# Greeting Cli

## Objectives

1. Build a CLI (command line interface) application.
2. Become familiar with the structure of a CLI application.
3. Get comfortable reading test output for a CLI application.

## Overview

![2001 Space Odyssey](http://readme-pics.s3.amazonaws.com/2001_A_Space_Odyssey_Style_B.jpg)

The year is 2001, humanity has discovered a mysterious object buried beneath the Lunar surface. Before Earth's most capable (and heroic) scientists can board the *Discovery One* and investigate, we must program the super-intelligent computer, HAL 9000. Luckily for us, however, most of HAL's functionality is already up and running. Our job is to program HAL's greeting for the user.

Our program will:

1. Greet the user.
2. Ask the user to input their name.
3. Capture and store the user's input using the `#gets` method.
4. Use that captured input to `puts` out a string that greets the user by name, using string interpolation.

Check out the video below to see the final product in action:

<iframe width="560" height="315" src="https://www.youtube.com/embed/sBQBP1Aaxzk" frameborder="0" allowfullscreen></iframe>

Notice that the the program is run with `ruby bin/greet`––we are using Ruby to run the code in the executable file that lives in our `bin` directory. Let's take a closer look at our project structure now.

## Project Structure

Check out the file structure below.

```
bin
   |–– greet
lib
   |–– greeting.rb
spec
   |–– 01_greeting_spec.rb
   |–– 02_cli_spec.rb
   |–– spec_helper.rb
...
```  

Let's take a moment to review:

### The `bin` Directory

The `bin` directory holds our **executable** file. This file is responsible for running the program. It contains code that actually enacts the command line interaction - i.e. greeting the user, asking the user for input, storing that input and then acting on it.

### The `lib` Directory

The `lib` directory is where we place the code that our program relies on to run. It is the meat of our CLI application. Our executable file *requires* the files in the `lib` directory and uses the code (for example, calling on any methods we might define) to enact the CLI.

### The `spec` Directory

This directory contains the tests for our program. We have tests for the code in the `lib` directory in `spec/01_greeting_spec.rb` and tests for the CLI, i.e. the user interaction portion of our application, in `spec/02_cli_spec.rb`. We'll use the test output from running `learn` along with the guidelines below to get our program working.

## Instructions

### Part I: The   `greeting` Method

Before we worry about building the CLI, we need to build the core functionality of our program––that is, the actions that will be carried out once we obtain the user's input. That code belongs in the `lib` directory.

Open up `lib/greeting.rb`. This is where we'll be writing our code. This part of the lab is test-driven. So, run the test for *just this section* by typing `learn spec/01_greeting_spec.rb` in your terminal.

In order to get our tests passing, we'll need to define a method, `#greeting` that takes in an argument of a person's name and uses string interpolation to print `"Hello #{name}. It's nice to meet you."`.

Once you get these tests passing, you're ready to move on to the next section.

### Part II: The CLI

Our CLI code belongs in the `bin` directory. Open up `bin/greet`. Notice that, according to convention, our executable file does not have a file extension (such as `.rb`). Take a look at the first lines of the file:

```ruby
#!/usr/bin/env ruby
require_relative '../lib/greeting.rb'
```

First, we have our shebang line that tells the terminal which interpreter to use to execute the remainder of the file. Second, we are requiring the `greeting.rb` file, from within the `lib` directory. This gives our executable file access to whatever code we write in that `lib` file.

If we run `learn spec/02_cli_spec.rb` we can see from the test output that the following is required:

1. Use `#puts` to output the string "Hi! I'm HAL, what's your name?"
2. Use the `#gets.strip` method to store the user's input and set it equal to a variable called `name`.
3. Call the `#greeting` method with an argument of the user's name (captured using `#gets` in step 2) to output the interpolated welcome string.

### Reading CLI Error Messages

Let's walk through some of the error messages from running the CLI spec together.

In your terminal, once you have your `spec/01_greeting_spec.rb` tests passing, run `rspec spec/02_cli_spec.rb`.

The first failure and error message should look something like this:


```bash
Failures:

  1) ./bin/greet executing a CLI Application outputs a welcome message and asks the user for input
     Failure/Error: expect($stdout).to receive(:puts).with("Hi! I'm HAL, what's your name?"), "Make sure bin/greet has code that can output 'Hi! I'm HAL, what's your name?' exactly."
       (#<IO:0x007fafb88ca568>).puts("Hi! I'm HAL, what's your name?")
           expected: 1 time with arguments: ("Hi! I'm HAL, what's your name?")
           received: 0 times
     # ./spec/02_cli_spec.rb:7:in `block (2 levels) in <top (required)>'
```

The portion that is significant for us comes at the beginning:

```bash
1) ./bin/greet executing a CLI Application outputs a welcome message and asks the user for input
     Failure/Error: expect($stdout).to receive(:puts).with("Hi! I'm HAL, what's your name?"), "Make sure bin/greet has code that can output 'Hi! I'm HAL, what's your name?' exactly."
```

The first part is a description of what is being tested. It means "running ./bin/greet to execute the CLI application should output a welcome message and ask the user for input".

Then, we see the description of our failure:

```bash
Failure/Error: expect($stdout).to receive(:puts).with("Hi! I'm HAL, what's your name?"), "Make sure bin/greet has code that can output 'Hi! I'm HAL, what's your name?' exactly."
```

The helpful part of this error message can be found at the end, after the `, `.

```bash
"Make sure bin/greet has code that can output 'Hi! I'm HAL, what's your name?' exactly."
```

The error message is letting us know that what we need to do to get the test passing.

Let's take a look at our second error message:

```bash
2) ./bin/greet executing a CLI Application uses #gets.strip to capture the user input and set it equal to a variable called name
     Failure/Error: name = get_variable_from_file("./bin/greet", "name")
     NameError:
       local variable `name' not defined in ./bin/greet.
```

Once again, it starts with a description that means "Running ./bin/greet should execute a CLI application that uses the gets.strip method to capture the user's input and set it equal to a variable called 'name'".

The important part of our error message is at the bottom of the `Failure/Error` portion of the text:

```bash
local variable `name' not defined in ./bin/greet.
```

This is telling us that the `bin/greet` file fails to set a variable called `name` equal to the user's input that is captured via the `#gets.strip` methods.

Now that you have a basic sense of how to read these error messages, as well as some guidelines for getting those tests passing, go ahead and get HAL working properly!

When you're done, run `learn` to confirm all tests are passing.

<iframe width="560" height="315" src="https://www.youtube.com/embed/7R0mD3uWk5c" frameborder="0" allowfullscreen></iframe>

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/greeting-cli' title='Greeting Cli'>Greeting Cli</a> on Learn.co and start learning to code for free.</p>

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/greeting-cli'>Greeting CLI Lab</a> on Learn.co and start learning to code for free.</p>
