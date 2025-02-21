class Board
  
  def initialize
    @role = ""
    @code = []
    @feedback = []
    @code_colours = ["red", "blue", "green", "yellow", "pink", "orange"]
    @feedback_colours = ["white", "black", "empty"]

    puts "Lets play: Mastermind"
    self.select_role
    if @role == "guesser"
      self.generate_code
      until @feedback == ["black", "black", "black", "black"] do
        play_round_guesser
      end
      puts "You win!"
      exit

    elsif @role == "creator"
      puts "Not yet built!"
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

  def generate_code
    @code = ["blue", "green", "yellow", "red"]
    p @code
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
