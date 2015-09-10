# Greeting Cli

## Goals

1. A simple CLI lab that requires no logic, only interpolation.
2. It demonstrates the structure of a CLI lab and having a bin use a method defined in a library.

## Outline

1. Describe Overview, building the first part of a complex military program. The first thing you need to do is ask the user for their name. After taking the user's name, the program should greet the user with "Hello, <user's name>. How are you doing?."
2. Screenshots / video of working program.

2. Structure of program. Walk user through what code goes where, the lib and the bin.

3. Have them first build the greeting method and use the test suites to make that pass.

4. They should then build the program in `greet` to load that file with require_relative.

5. Greet should output a hello and ask their name.

6. It should take input.

7. They need to use that input in greet.

8. Show them how to walk through the errors in the CLI spec.

Joshua Wargames clip. https://www.youtube.com/watch?v=7R0mD3uWk5c

## Objectives

1. Build a CLI (command line interface) application.
2. Become familiar with the strcutre of a CLI application. 
3. Get comfortable reading test output for a CLI application. 


## Overview
![http://readme-pics.s3.amazonaws.com/2001_A_Space_Odyssey_Style_B.jpg]()

The year is 2001, humanity has discovered a mysterious object buried beneath the Lunar surface. Before Earth's most capable (and heroic) scientists can board the *Discovery One* and investigate, we must program the super-intelligent computer, HAL 9000. Luckily for us, however, most of HAL's functionality is already up and running. Our job is program HAL's greeting to the user. 

Our program will: 

1. Greet the user.
2. Ask the user to input their name.
3. Capture and store the user's input using the `#gets` method. 
4. Use that captured input to puts out a string that greets the user by name, using string interpolation. 

Check out the video below to see the final product in action: 


Notice that the the program is run with `ruby bin/greet`––we are using ruby to run the code in the executable file that lives in our `bin` directory. Let's take a closer look at our project structure now. 

## Project Structure

**If you haven't done so already, fork and clone this lab down onto your computer**. 

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

The `bin` directory holds our **exectuable** file. This file is responsible for running the program. It contains code that actually enacts the command line interaction––i.e. greeting the user, asking the user for input, storing that input and then acting on it. 

### The `lib` Directory

The `lib` directory is where we place the code that our program relies on to run. It is the meat of our CLI application. Our executable file *requires* the files in the `lib` directory and uses the code (for example, calling on any methods we might define) to to enact the CLI. 

### The `spec` Directory

This directory contains the tests for our program. We have tests for the code in the `lib` directory in `spec/01_greeting.rb` and tests for the CLI, i.e. the user interaction portion of our application, in `spec/02_cli_spec.rb`. We'll use the test output from running `learn` along with the guidelines below to get our program working. 


