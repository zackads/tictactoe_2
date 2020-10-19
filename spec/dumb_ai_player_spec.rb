require 'dumb_ai_player'

RSpec.describe DumbAIPlayer do
  context 'when created' do
    it 'remembers its token' do
      # Arrange
      game = double('Game')
      ai_player = DumbAIPlayer.new('X', game)

      # Act
      player_token = ai_player.token

      # Assert
      expect(player_token).to eq('X')
    end

    context 'when it plays a valid move,' do
      it 'that move is sent to the game' do
        # Arrange
        game = spy('GameManager')
        ai_player = DumbAIPlayer.new('X', game)
        possible_valid_moves = [0, 1, 2, 3, 4, 5, 6, 7, 8]

        # Act
        ai_player.play

        # Assert
        expect(game).to have_received(:make_move).with(be_included_in(*possible_valid_moves)) # `be_include_in` is a custom matcher, check spec_helper
      end
    end
  end
end
