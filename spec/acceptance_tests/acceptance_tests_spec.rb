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

    # What do you think of this style of acceptance test?
    context 'when the game is played to completion' do
      it 'ends with a win, lose or draw' do
        100.times do # 100 tests, takes 50+ seconds...
          # Arrange
          ending_words = %w[win won winner loss lost lose draw drew drawn]

          shell_command = 'ruby tictactoe.rb'

          # Act
          stdin, stdout = Open3.popen2(shell_command)

          100.times do # User enters random moves 100 times, after which we expect the game to have finished (accounting for double-entered moves)...
            stdin.puts(rand(0..8))
          end
          output = stdout.read

          # Assert
          expect(output).to satisfy { |output| string_contains_one_of_words(output, ending_words) }
        end
      end
    end
  end
end
