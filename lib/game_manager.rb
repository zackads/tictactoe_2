class GameManager
  def initialize(grid: nil, scorer: nil, players: nil)
    @grid = grid
    @scorer = scorer
    @players = players
    @current_player = 'X'
  end

  def play
    loop do
      over? ? break : @players[0].make_move(@grid)
      over? ? break : @players[1].make_move(@grid)
    end
  end

  def grid
    @grid.raw
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
