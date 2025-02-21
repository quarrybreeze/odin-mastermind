class Board
  
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
      puts "You win!"
      exit

    elsif @role == "creator"
      self.player_generate_code
      until @feedback == ["black", "black", "black", "black"] do
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
    # 4.times do
    #   @code.push(@code_colours.sample)
    # end
    @code = ["blue", "green", "yellow", "red"]
    p @code
  end

  def computer_guess_code
    guess_array = []
    4.times do
      guess_array.push(@code_colours.sample)
    end
    puts "Computer guess ##{@guess_number} #{guess_array}"
    @guess_number += 1
    self.get_feedback(guess_array)
  end

  def player_generate_code
    puts "What code do you choose?"
    puts "The colour options are red, blue, green, yellow, pink, orange"
    input = gets.chomp.split(", ")
    input.each do |colour|
      if (@code_colours.include?(colour) == false)
        puts "You chose a wrong colour. try again"
        self.player_generate_code
      end
    end
    @code = input
  end

  def get_feedback(guess_array)
    @feedback = []
    guess_array.each do |guess|
      if @code.include?(guess) == true
        @feedback.push("white")
      else 
        @feedback.push("none")
      end
    end

    guess_array.each do |guess|
      if (guess_array[guess_array.index(guess).to_i] == @code[guess_array.index(guess).to_i])
        @feedback[guess_array.index(guess).to_i] = "black"
      end
    end

    @feedback = @feedback.reject {|peg| peg =='none'}
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
    self.get_feedback(guess_array)
  end

end
