require 'grid'

class GameManager
  def initialize(grid: Grid.new, scorer: Scorer.new)
    @grid = grid
    @scorer = scorer
    @current_player = 'X'
  end

  def grid
    @grid.raw
  end

  def make_move(move)
    @grid.record_move(@current_player, move)
    change_current_player
  end

  def over?
    @grid.full? || %w[X O].include?(winner) 
  end

  def winner
    @scorer.winner(@grid) # method injection
  end

  private

  def change_current_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end
end