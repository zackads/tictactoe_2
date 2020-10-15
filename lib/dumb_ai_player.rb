class DumbAIPlayer
  attr_reader :token

  def initialize(token, game)
    @token = token
    @game = game
  end

  def play
    @game.make_move(0)
  end
end
