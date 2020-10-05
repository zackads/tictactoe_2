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

    it 'does not permit more than one move per square' do
      # Arrange
      game = GameManager.new

      # Act
      game.make_move('A3') # X

      # Assert
      expect { game.make_move('A3') }.to raise_error(ArgumentError)
    end

    it 'does not accept off grid coordinates' do
      # Arrange
      game = GameManager.new

      # Assert
      expect { game.make_move('A4') }.to raise_error(ArgumentError)
    end
  end
end
