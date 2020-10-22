require 'open3'

RSpec.describe 'the command line user interface' do
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
      shell_command = 'ruby tictactoe.rb'

      # Act
      stdin, stdout = Open3.popen2(shell_command) # Run app from command line and pipe its inputs and outputs to new IO objects just for testing
      output = stdout.read # Return everything that was printed to command line
      stdin.puts('q') # Simulates user input (user ends game early by entering 'q')

      # Assert
      expect(output).to include(blank_grid)
    end

    it 'requests user input and displays it on the grid' do
      # Arrange
      user_move = 7
      grid_with_one_move = <<~GRID
        +---+---+---+
        | 0 | 1 | 2 |
        +---+---+---+
        | 3 | 4 | 5 |
        +---+---+---+
        | 6 | X | 8 |
        +---+---+---+
      GRID
      shell_command = 'ruby tictactoe.rb'

      # Act
      stdin, stdout = Open3.popen2(shell_command)
      stdin.puts(user_move) # User enters move
      stdin.puts('q') # User ends game early
      output = stdout.read

      # Assert
      expect(output).to include(grid_with_one_move)
    end
  end
end

# ===================================================================================

RSpec.describe 'old design acceptance tests' do
  context 'when the user creates a new game by instantiating the GameManager class' do
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
