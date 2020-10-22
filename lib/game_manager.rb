require_relative('outcome')

class GameManager
  def initialize(grid: nil, scorer: nil, players: nil)
    @grid = grid
    @scorer = scorer
    @players = players
    @outcome = Outcome.new
  end

  def play
    loop do
      @players.each { |player| over? ? declare : player.make_move(@grid) }
    end
  end

  private

  def declare
    @outcome.winning_token = winning_token
    @players.each { |player| player.handle_outcome(@outcome) }
    exit
  end

  def over?
    @grid.full? || winner?
  end

  def winner?
    winning_token.is_a?(String)
  end

  def winning_token
    @scorer.winner(@grid)
  end
end
