class CLIStrategy
  def get_move(grid)
      print <<~GRID
      +---+---+---+
      | #{grid.raw[0]} | #{grid.raw[1]} | #{grid.raw[2]} |
      +---+---+---+
      | #{grid.raw[3]} | #{grid.raw[4]} | #{grid.raw[5]} |   
      +---+---+---+
      | #{grid.raw[6]} | #{grid.raw[7]} | #{grid.raw[8]} |
      +---+---+---+
      GRID

      puts "Make your next move: \n"
      move = $stdin.gets.to_i
  end
end


