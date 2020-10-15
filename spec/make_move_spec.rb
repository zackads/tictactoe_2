require 'game_manager'

RSpec.describe 'the class-based user interface' do
  describe GameManager do
    context 'when the current player makes a move' do
      it 'records that move in the correct position in the grid' do
        # Arrange
        game = GameManager.new

        # Act
        game.make_move(0)

        # Assert
        expect(game.grid).to eq(['X', 1, 2, 3, 4, 5, 6, 7, 8])
      end
    end

    it 'records that move in the correct position in the grid' do
      # Arrange
      game = GameManager.new

      # Act
      game.make_move(0)
      game.make_move(4)

      # Assert
      expect(game.grid).to eq(['X', 1, 2, 3, 'O', 5, 6, 7, 8])
    end
  end
end
