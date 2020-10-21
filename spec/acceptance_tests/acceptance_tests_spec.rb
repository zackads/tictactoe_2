require 'game_manager'

RSpec.describe GameManager do
  context 'when the user starts the game from the command line' do
    it 'displays a blank grid' do
      # Arrange
      blank_grid = <<~GRID
        +---+---+---+
        | 0 | 1 | 2 |
        +---+---+---+
        | 3 | 4 | 5 |   
        +---+---+---+
        | 6 | 7 | 8 |
        +---+---+---+
      GRID

      # Act & Assert
      expect { system('ruby tictactoe.rb') }.to output(include(blank_grid)).to_stdout
    end
  end

  context 'when the user creates a new game by instantiating the GameManager class' do
    xit 'creates a blank grid' do
      # Arrange
      player_strategy = CLIStrategy.new
      ai_strategy = DumbAIStrategy.new
      game = GameManager.new(Player.new('X', player_strategy), Player.new('O', ai_strategy))

      # Assert
      expect(game.grid).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    context 'when the user makes her first move' do
      xit 'records that move on the grid' do
        # Arrange
        game = GameManager.new

        # Act
        game.make_move(0)

        # Assert
        expect(game.grid).to eq(['X', 1, 2, 3, 4, 5, 6, 7, 8])
      end
    end
  end

  xit 'records moves from players' do
    # Arrange
    game = GameManager.new

    # Act
    game.make_move(0) # X
    game.make_move(4) # O
    game.make_move(6) # X

    # Assert
    expect(game.grid).to eq(['X', 1, 2, 3, 'O', 5, 'X', 7, 8])
  end

  xit 'does not accept invalid moves' do
    # Arrange
    game = GameManager.new

    # Act
    game.make_move(0) # X

    # Assert
    expect { game.make_move(0) }.to raise_error(ArgumentError) # Two moves on one square
    expect { game.make_move(9) }.to raise_error(ArgumentError) # Off-grid square
    expect { game.make_move('XYZ') }.to raise_error(ArgumentError) # Not a square
  end

  xit 'declares a winner' do
    # Arrange
    game = GameManager.new

    # Act
    game.make_move(0) # X
    game.make_move(4) # O
    game.make_move(1) # X
    game.make_move(8) # O
    game.make_move(2) # X - winning move

    # Assert
    expect(game.over?).to eq(true)
    expect(game.winner).to eq('X')
  end
end
