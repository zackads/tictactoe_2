class DumbAIStrategy
  def get_move(grid)
    grid.empty_squares.sample
  end

  def invalid_move(_); end

  def you_won; end

  def you_lost; end

  def draw; end

  # ^^^ I think these are interface segretation principle violations
end
