require 'grid'

class GameManager
  def initialize(grid: Grid.new, scorer: Scorer.new, players: [])
    @grid = grid
    @scorer = scorer
    @players = players
    @current_player = @players.first
  end

  def grid
    @grid.raw
  end

  def make_move
    @current_player.make_move(grid)
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
    @players = @players.rotate
    @current_player = @players.first
  end
end
