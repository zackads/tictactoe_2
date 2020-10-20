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
      allow($stdin).to receive(:gets).and_return("0")

      strategy = CLIStrategy.new
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
    end

  context 'when passed a partially filled grid' do
    it 'displays the grid to the command line' do
      # Arrange
      allow($stdin).to receive(:gets).and_return("0")
      grid = double('grid', raw: ['X', 1, 2, 'X', 4, 5, 'O', 7, 8], empty_squares: [1, 2, 4, 5, 7, 8])
      strategy = CLIStrategy.new
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
    end

    it 'displays the grid to the command line' do
      # Arrange
      allow($stdin).to receive(:gets).and_return("0")
      grid = double('grid', raw: [0, 'X', 'O', 3, 4, 5, 6, 'X', 'O'], empty_squares: [0, 3, 4, 5, 6])
      strategy = CLIStrategy.new
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
    it 'requests the next move from the user' do
      # Arrange
      $stdin = spy('stdin', gets: "0")
      strategy = CLIStrategy.new
      grid = double('grid', raw: [0, 1, 2, 3, 4, 5, 6, 7, 8], empty_sqaures: [0, 1, 2, 3, 4, 5, 6, 7, 8])

      # Act
      move = strategy.get_move(grid)
      
      # Assert
      expect($stdin).to have_received(:gets)
    end

    it 'converts user input into a valid grid square' do
      # Arrange
      $stdin = spy('stdin', gets: "0")
      strategy = CLIStrategy.new
      grid = double('grid', raw: [0, 1, 2, 3, 4, 5, 6, 7, 8], empty_sqaures: [0, 1, 2, 3, 4, 5, 6, 7, 8] )

      # Act
      move = strategy.get_move(grid)

      # Assert
      expect(move).to eq(0)
    end
  end



    xit 'does not allow the user to enter an invalid move' do
    end
  end
end