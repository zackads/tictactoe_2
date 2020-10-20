class DumbAIStrategy
  def get_move(grid)
    grid.empty_squares.sample
  end
end
