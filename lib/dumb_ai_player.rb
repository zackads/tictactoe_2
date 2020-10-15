class DumbAIPlayer
  attr_reader :token

  def initialize(token, game)
    @token = token
    @game = game
  end

  def play
    @game.make_move('A3')
  end
end
