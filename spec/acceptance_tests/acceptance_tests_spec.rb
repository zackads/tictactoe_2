require 'game_manager'

RSpec.describe 'the class-based user interface' do
  describe GameManager do
    context 'when the user creates a new game by instantiating the GameManager class' do
      it 'creates a blank grid' do
        # Arrange
        game = GameManager.new

        # Assert
        expect(game.grid).to eq([
                                  [nil, nil, nil],
                                  [nil, nil, nil],
                                  [nil, nil, nil]
                                ])
      end
    end

    context 'when a new game is started' do
      it 'records moves from players' do
        # Arrange
        game = GameManager.new

        # Act
        game.make_move('A3') # X
        game.make_move('B2') # O
        game.make_move('A1') # X

        # Assert
        expect(game.grid).to eq([
                                  ['X', nil, nil], # 3
                                  [nil, 'O', nil], # 2
                                  ['X', nil, nil]  # 1
                                ]) # A    B    C
      end
    end
  end
end
