class Board
  attr_accessor :feedback, :code
  
  def initialize
    @role = ""
    @code = []
    @feedback = []
    @code_colours = ["red", "blue", "green", "yellow", "pink", "orange"]
    @feedback_colours = ["white", "black", "empty"]
    @guess_number = 1

    puts "Lets play: Mastermind"
    self.select_role
    if @role == "guesser"
      self.computer_generate_code
      until @feedback == ["black", "black", "black", "black"] do
        play_round_guesser
      end
      puts "You win! It took you #{@guess_number} guesses!"
      exit

    elsif @role == "creator"
      self.player_generate_code
      until @feedback == ["black"] * @code.length do
        computer_guess_code
      end
      puts "Computer wins after #{@guess_number} guesses"
      exit
    end 
  end

  def display
    puts "Generating feedback..."
    p @feedback
  end

  def select_role
    puts "Do you want to create the code or guess the code?"
    puts "Reply with guess to become a guesser"
    puts "Reply with create to become a creator"
    input = gets.chomp
    if (input == "guess")
      @role = "guesser"
    elsif (input == "create")
      @role = "creator"
    else
      puts "Invalid entry, please try again"
      self.select_role
    end
  end

  def computer_generate_code
    4.times do
      @code.push(@code_colours.sample)
    end
  end

  def computer_guess_code
    guess_array = Array.new(@code.length) { @code_colours.sample }  # Random full guess
    puts "Computer guess ##{@guess_number} is #{guess_array}"
    get_feedback(guess_array)
    @guess_number += 1
  end

  def player_generate_code
    puts "Choose 1 colour?"
    puts "The colour options are red, blue, green, yellow, pink, orange"
    input = gets.chomp.split(", ")
    input.each do |colour|
      if (@code_colours.include?(colour) == false)
        puts "You chose a wrong colour. try again"
        self.player_generate_code
      end
    end
    @code = input
    p @code
  end

  def get_feedback(guess_array)
    @feedback = []
    
    # Track exact matches first
    guess_array.each_with_index do |guess, index|
      if guess == @code[index]
        @feedback.push("black")
      elsif @code.include?(guess)
        @feedback.push("white")
      else
        @feedback.push("none")
      end
    end
  
    @feedback.reject! { |peg| peg == 'none' } # Remove 'none' pegs
    puts "Generating feedback..."
    p @feedback
  end

  def play_round_guesser
    puts "What colors do you guess?"
    guess_array = gets.chomp.split(", ")
    guess_array.each do |guess|
      if (@code_colours.include?(guess) == false)
        puts "You chose a wrong colour. try again"
        self.play_round_guesser
      end
    end
    puts "Player guess ##{@guess_number}"
    @guess_number += 1
    self.get_feedback(guess_array)
  end

end
