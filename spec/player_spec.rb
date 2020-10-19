require 'player'

RSpec.describe Player do
  context 'when a new player is created' do
    it 'recalls its token' do
      # Arrange
      cli_strategy = double('cli', get_player_move: 0)
      player = Player.new('X', cli_strategy)

      # Act
      token = player.token

      # Assert
      expect(token).to eq('X')
    end
  end
end
