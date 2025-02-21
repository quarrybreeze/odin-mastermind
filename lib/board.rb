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
    # 4.times do
    #   @code.push(@code_colours.sample)
    # end
    @code = ["blue", "green", "yellow", "red"]
    p @code
  end

  def get_feedback(guess_array)
    guess_array.each do |guess|
      # p @code.include?(guess)
      # p guess_array.index(guess)

      if @code.include?(guess) == true
        @feedback.push("white")
      else 
        @feedback.push("none")
      end
    end

    guess_array.each do |guess|
      if (guess_array[guess_array.index(guess).to_i] == @code[guess_array.index(guess).to_i])
        @feedback[guess_array.index(guess).to_i] = "Black"
      end
    end
    @feedback = @feedback.reject {|peg| peg =='none'}
    puts "Generating feedback..."
    p @feedback
  end

end

new_game = Board.new
new_game.generate_code
new_game.get_feedback(["blue","green","orange","pink"])
