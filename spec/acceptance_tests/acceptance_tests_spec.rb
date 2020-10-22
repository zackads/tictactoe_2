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
      stdin.puts('q') # Simulates user input (user ends game early by entering 'q')
      output = stdout.read # Return everything that was printed to command line

      # Assert
      expect(output).to include(blank_grid)
    end

    it 'requests user input and displays it on the grid' do
      # Arrange
      user_move = 3
      user_token = '| X |'
      shell_command = 'ruby tictactoe.rb'

      # Act
      stdin, stdout = Open3.popen2(shell_command)
      stdin.puts(user_move) # User enters move
      stdin.puts('q') # User ends game early
      output = stdout.read

      # Assert
      expect(output).to include(user_token)
    end

    context 'after the user makes a move' do
      it "it displays the opponent's move on the grid" do
        # Arrange
        user_move = 3
        opponent_token = '| O |'
        shell_command = 'ruby tictactoe.rb'

        # Act
        stdin, stdout = Open3.popen2(shell_command)
        stdin.puts(user_move) # User enters move
        stdin.puts('q') # User ends game early
        output = stdout.read

        # Assert
        expect(output).to include(opponent_token)
      end
    end

    context 'when the player attempts to make an off-grid move' do
      it 'notifies the player' do
        # Arrange
        user_move = '10'
        error_message = "Uh-oh! That's not a valid move.  Please try again."
        shell_command = 'ruby tictactoe.rb'

        # Act
        stdin, stdout = Open3.popen2(shell_command)
        stdin.puts(user_move)
        stdin.puts('q')
        output = stdout.read

        # Assert
        expect(output).to include(error_message)
      end
    end

    context 'when the player attempts to make a move on a square that already has a move' do
      it 'notifies the player' do
        # Arrange
        user_move = '4'
        duplicate_user_move = '4'
        error_message = "Uh-oh! That's not a valid move.  Please try again."
        shell_command = 'ruby tictactoe.rb'

        # Act
        stdin, stdout = Open3.popen2(shell_command)
        stdin.puts(user_move)
        stdin.puts(duplicate_user_move)
        stdin.puts('q')
        output = stdout.read

        # Assert
        expect(output).to include(error_message)
      end
    end

    context 'when the game is played' do
      it 'eventually ends with a win, lose or draw' do
        100.times do
          # Arrange
          winning_message = "Congratulations, you've won! 🎉 "
          losing_message = 'Aw crumbs! The other player won 😞'
          draw_message = "It's a draw! You were evenly matched 😬"
          shell_command = 'ruby tictactoe.rb'

          # Act
          stdin, stdout = Open3.popen2(shell_command)
          counter = 1

          100.times do
            stdin.puts(rand(0..8)) # User enters random moves until game is over
          end
          output = stdout.read

          # Assert
          expect(output).to include(winning_message || losing_message || draw_message)
        end
      end
    end
  end
end

# ===================================================================================

RSpec.describe 'old design acceptance tests' do
  context 'when the user creates a new game by instantiating the GameManager class' do
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
end
