class Player
  attr_reader :token

  def initialize(token, strategy)
    @token = token
    @strategy = strategy
  end

  def make_move(grid)
    move = @strategy.get_move(grid)

    grid.record_move(@token, move)
  end
end
