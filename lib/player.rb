class Player
  attr_reader :token

  def initialize(token, strategy)
    @token = token
    @strategy = strategy
  end

  def make_move(grid)
    move = @strategy.get_move(grid)
    grid.record_move(@token, move)
  rescue ArgumentError
    @strategy.invalid_move(grid)
  end

  def handle_outcome(outcome)
    @strategy.you_won if outcome.winning_token == token
    if outcome.winning_token.nil?
      @strategy.draw
    else
      @strategy.you_lost
    end
  end
end
