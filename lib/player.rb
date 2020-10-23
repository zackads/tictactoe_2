class Player
  attr_reader :token

  def initialize(token, strategy)
    @token = token
    @strategy = strategy
  end

  def make_move(grid)
    move = @strategy.get_move(grid, @token)
    grid.record_move(@token, move)
  rescue ArgumentError
    @strategy.invalid_move(grid, @token)
  end

  def handle_outcome(outcome)
    if outcome.winning_token == token
      @strategy.you_won(@token)
    elsif outcome.winning_token.nil?
      @strategy.draw(@token)
    else
      @strategy.you_lost(@token)
    end
  end
end
