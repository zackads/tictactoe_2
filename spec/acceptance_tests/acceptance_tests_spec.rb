require 'game_manager'

RSpec.describe 'the class-based user interface' do
  describe GameManager do
    context 'when the user creates a new game by instantiating the GameManager class' do
      it 'creates a blank grid' do
        # Arrange
        game = GameManager.new

        # Assert
        expect(game.grid).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
      end

      context 'when the user makes her first move' do
        xit 'records that move on the grid' do
          # Arrange
          game = GameManager.new

          # Act
          game.make_move('A3')

          # Assert
          expect(game.grid).to eq([
                                    ['X', nil, nil],
                                    [nil, nil, nil],
                                    [nil, nil, nil]
                                  ])
        end
      end
    end

    xit 'records moves from players' do
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

    xit 'does not invalid moves' do
      # Arrange
      game = GameManager.new

      # Act
      game.make_move('A3') # X

      # Assert
      expect { game.make_move('A3') }.to raise_error(ArgumentError) # Two moves on one square
      expect { game.make_move('A4') }.to raise_error(ArgumentError) # Off-grid square
      expect { game.make_move('XYZ') }.to raise_error(ArgumentError) # Not a square
    end

    xit 'declares a winner' do
      # Arrange
      game = GameManager.new

      # Act
      game.make_move('A3') # X
      game.make_move('B2') # O
      game.make_move('B3') # X
      game.make_move('C1') # O
      game.make_move('C3') # X - winning move

      # Assert
      expect(game.over?).to eq(true)
      expect(game.winner).to eq('X')
    end
  end
end

# Design ideas below this line

# class HumanPlayer
#   def initialize(game)
#     @game = game
#   end

#   def take_turn
#     user_input = get_user_input
#     game.make_move(user_input)
#   end

#   def get_user_input
#     puts "Enter your move:"
#     gets user_input
#     user_input
#   end
# end

# class AIPlayer
#   def initialize(game)
#     @game = game
#   end

#   def take_turn
#     # ...
#   end

#   def get_u
# end
