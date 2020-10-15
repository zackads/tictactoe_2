require 'game_manager'

RSpec.describe 'the class-based user interface' do
  describe GameManager do
    context 'when the current player makes a move' do
      xit 'records that move in the correct position in the grid' do
        # Arrange
        game = GameManager.new

        # Act
        game.make_move('A3')

        # Assert
        expect(game.grid).to eq(
          [['X', nil, nil],
           [nil, nil, nil],
           [nil, nil, nil]]
        )
      end
    end

    xit 'records that move in the correct position in the grid' do
      # Arrange
      game = GameManager.new

      # Act
      game.make_move('A3')
      game.make_move('B2')

      # Assert
      expect(game.grid).to eq(
        [['X', nil, nil],
         [nil, 'O', nil],
         [nil, nil, nil]]
      )
    end
  end
end

#   ['X', nil, nil], # 3
#   [nil, 'O', nil], # 2
#   ['X', nil, nil]  # 1
# ]) # A    B    C
