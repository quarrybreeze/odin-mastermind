class Board
  
  def initialize
    @code_colours = ["red", "blue", "green", "yellow", "pink", "orange"]
    @feedback_colours = ["white", "black", "empty"]
    @code = []
    @feedback = []
  end

  def display
    puts "Generating feedback..."
    p @feedback
  end

  def generate_code
    4.times do
      @code.push(@code_colours.sample)
    end
    p @code
  end

  def get_feedback(guess_array)
    guess_array.each do |guess|
      # p @code.include?(guess)
      # p guess_array.index(guess)

      if @code.include?(guess) == true
        @feedback[guess_array.index(guess).to_i] = "white"
      else 
        @feedback[guess_array.index(guess).to_i] = "none"
      end
    end
    puts "Generating feedback..."
    p @feedback
  end

end

new_game = Board.new
new_game.generate_code
new_game.get_feedback(["blue","green","orange","pink"])
