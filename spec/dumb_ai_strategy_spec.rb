require 'dumb_ai_strategy'

RSpec.describe DumbAIStrategy do
  context 'given a dumb AI Strategy is chosen' do
    it 'conforms to the strategy interface' do
      # Arrange
      strategy = DumbAIStrategy.new

      # Assert
      expect(strategy).to respond_to(:make_move).with(1).argument
    end

    it 'makes a random move' do
      # Arrange
      grid = double('grid')

      # Act

      # Assert
    end
  end
end
