require 'dumb_ai_strategy'

RSpec.describe DumbAIStrategy do
  context 'when instantiated' do
    it 'conforms to the strategy interface' do
      # Arrange
      strategy = DumbAIStrategy.new

      # Assert
      expect(strategy).to respond_to(:get_move).with(1).argument
    end
  end

  context 'when passed an empty grid' do
    it 'makes random moves' do
      100.times do
        # Arrange
        grid = double('grid', raw: [0, 1, 2, 3, 4, 5, 6, 7, 8], empty_squares: [0, 1, 2, 3, 4, 5, 6, 7, 8])
        strategy = DumbAIStrategy.new

        # Act
        move = strategy.get_move(grid)

        # Assert
        expect(move).to be_between(0, 8).inclusive
      end
    end

    context 'when passed a partially filled grid' do
      it 'makes random moves on empty squares only' do
        # Arrange
        empty_squares = [2, 3, 4, 7, 8]
        grid = double('grid', raw: ['X', 'O', 2, 3, 4, 'X', 'O', 7, 8], empty_squares: empty_squares)
        strategy = DumbAIStrategy.new

        # Act
        move = strategy.get_move(grid)

        # Assert
        expect(move).to be_included_in(*empty_squares)
      end
    end
  end
end
