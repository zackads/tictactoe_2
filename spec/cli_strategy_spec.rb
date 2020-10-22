require 'cli_strategy'
require 'stringio'

RSpec.describe CLIStrategy do
  context 'when instantiated' do
    it 'conforms to the strategy interface' do
      # Arrange
      strategy = CLIStrategy.new

      # Assert
      expect(strategy).to respond_to(:get_move).with(1).argument
    end
  end

  context 'when passed an empty grid' do
    it 'displays the grid to the command line' do
      # Arrange
      grid = double('grid', raw: [0, 1, 2, 3, 4, 5, 6, 7, 8], empty_squares: [0, 1, 2, 3, 4, 5, 6, 7, 8])
      strategy = CLIStrategy.new
      allow(strategy).to receive(:gets).and_return('0')
      expected_output = <<~GRID
        +---+---+---+
        | 0 | 1 | 2 |
        +---+---+---+
        | 3 | 4 | 5 |
        +---+---+---+
        | 6 | 7 | 8 |
        +---+---+---+
      GRID

      # Act + Assert
      expect { strategy.get_move(grid) }.to output(include(expected_output)).to_stdout

      # Teardown
      $stdin = STDIN
    end

    context 'when passed a partially filled grid' do
      it 'displays the grid to the command line' do
        # Arrange
        grid = double('grid', raw: ['X', 1, 2, 'X', 4, 5, 'O', 7, 8], empty_squares: [1, 2, 4, 5, 7, 8])
        strategy = CLIStrategy.new
        allow(strategy).to receive(:gets).and_return('0')
        expected_output = <<~GRID
          +---+---+---+
          | X | 1 | 2 |
          +---+---+---+
          | X | 4 | 5 |
          +---+---+---+
          | O | 7 | 8 |
          +---+---+---+
        GRID

        # Act + Assert
        expect { strategy.get_move(grid) }.to output(include(expected_output)).to_stdout

        # Teardown
        $stdin = STDIN
      end

      it 'displays the grid to the command line' do
        # Arrange
        grid = double('grid', raw: [0, 'X', 'O', 3, 4, 5, 6, 'X', 'O'], empty_squares: [0, 3, 4, 5, 6])
        strategy = CLIStrategy.new
        allow(strategy).to receive(:gets).and_return('0')
        expected_output = <<~GRID
          +---+---+---+
          | 0 | X | O |
          +---+---+---+
          | 3 | 4 | 5 |
          +---+---+---+
          | 6 | X | O |
          +---+---+---+
        GRID

        # Act + Assert
        expect { strategy.get_move(grid) }.to output(include(expected_output)).to_stdout
      end
    end

    context 'when passed any grid with at least one empty square' do
      it 'converts user input into a valid grid square' do
        # Arrange
        strategy = CLIStrategy.new
        allow(strategy).to receive(:gets).and_return('0')
        grid = double('grid', raw: [0, 1, 2, 3, 4, 5, 6, 7, 8], empty_squares: [0, 1, 2, 3, 4, 5, 6, 7, 8])

        # Act
        move = strategy.get_move(grid)

        # Assert
        expect(move).to eq(0)
      end
    end

    context 'when told the last move was invalid' do
      it 'notifies and prompts the user for another move' do
        # Arrange
        strategy = CLIStrategy.new
        allow(strategy).to receive(:gets).and_return('0')
        grid = double('grid', raw: [0, 1, 2, 3, 4, 5, 6, 7, 8], empty_squares: [0, 1, 2, 3, 4, 5, 6, 7, 8])

        # Act
        move = strategy.invalid_move(grid)

        # Assert
        expect(move).to eq(0)
      end
    end
  end
end
