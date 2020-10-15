class Scorer
  WINNING_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left vertical
    [1, 4, 7], # middle vertical
    [2, 5, 8], # right vertical
    [0, 4, 8], # left diagonal
    [2, 4, 6] # right diagonal
  ].freeze

  def winner(grid)
    WINNING_COMBINATIONS.each do |combination|
      if array_is_all_the_same?([grid.raw[combination[0]], grid.raw[combination[1]], grid.raw[combination[2]]])
        winning_token = grid.raw[combination[0]]
        return winning_token
      end
    end
    winner_not_found
  end

  private

  def array_is_all_the_same?(array)
    array.uniq.size == 1
  end

  def winner_not_found
    nil
  end
end
