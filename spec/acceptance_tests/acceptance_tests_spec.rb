require 'game_manager'

RSpec.describe 'the class-based user interface' do
  describe GameManager do
    context 'when the user creates a new game by instantiating the GameManager class' do
      it 'creates a blank grid' do
        # Arrange
        game = GameManager.new

        # Assert
        expect(game.grid).to eq([
                                  [nil, nil, nil], # 3
                                  [nil, nil, nil], # 2
                                  [nil, nil, nil]  # 1
                                  # A    B    C
                                ])
      end

      context 'when the user makes her first move' do
        it 'records that move on the grid' do
          # Arrange
          game = GameManager.new
          game.new_player('X')

          # Act
          game.add_move('X', 'A3')

          # Assert
          expect(game.grid).to eq([
                                    ['X', nil, nil],
                                    [nil, nil, nil],
                                    [nil, nil, nil]
                                  ])
        end
      end
    end
  end
end
