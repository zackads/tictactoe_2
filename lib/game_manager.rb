class GameManager
  def initialize(grid: nil, scorer: nil, players: nil)
    @grid = grid
    @scorer = scorer
    @players = players
  end

  def play
    loop do
      over? ? break : @players[0].make_move(@grid)
      over? ? break : @players[1].make_move(@grid)
    end
  end

  private

  def over?
    @grid.full? || @players.include?(winner)
  end

  def winner
    @scorer.winner(@grid) # method injection
  end
end
