require 'cli_strategy'

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
    end

    xit 'requests the next move from the user' do
    end

    xit 'does not allow the user to enter an invalid move' do
    end
  end
end
