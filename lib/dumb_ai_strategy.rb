class DumbAIStrategy
  def get_move(grid, _)
    grid.empty_squares.sample
  end

  def invalid_move(_, _); end

  def you_won(_); end

  def you_lost(_); end

  def draw(_); end

  # ^^^ I think these are interface segretation principle violations
end
