class CLIStrategy
  def get_move(grid)
    print_grid(grid)

    puts "Make your next move: \n"
    user_input = gets.chomp
    if user_input == 'q'
      exit
    else
      move = user_input.to_i
      p(move)
      move
    end
  end

  def invalid_move(grid)
    puts "Uh-oh! That's not a valid move.  Please try again."
    get_move(grid)
  end

  private

  def print_grid(grid)
    print <<~GRID
      +---+---+---+
      | #{grid.raw[0]} | #{grid.raw[1]} | #{grid.raw[2]} |
      +---+---+---+
      | #{grid.raw[3]} | #{grid.raw[4]} | #{grid.raw[5]} |
      +---+---+---+
      | #{grid.raw[6]} | #{grid.raw[7]} | #{grid.raw[8]} |
      +---+---+---+
    GRID
  end
end
