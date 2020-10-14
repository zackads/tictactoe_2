require 'grid'

class GameManager
  def initialize(grid: Grid.new, scorer: Scorer.new)
    @grid = grid
    @scorer = scorer
    @current_player = 'X'

    scorer.grid = grid unless scorer.grid
  end

  def grid
    @grid.raw
  end

  def make_move(move)
    @grid.record_move(@current_player, move)
    change_current_player
  end

  def over?
    @grid.full? || %w[X O].include?(@scorer.winner)
  end

  def winner
    @scorer.winner
  end

  private

  def change_current_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end
end

# make_move to take arguments and update current_game_state
# create current_game_state method which will then make 2nd acceptance test pass
