require 'dumb_ai_strategy'

RSpec.describe DumbAIStrategy do
  context 'when instantiated' do
    it 'conforms to the strategy interface' do
      # Arrange
      strategy = DumbAIStrategy.new

      # Assert
      expect(strategy).to respond_to(:get_move).with(1).argument
      expect(strategy).to respond_to(:invalid_move).with(1).argument
      expect(strategy).to respond_to(:you_won)
      expect(strategy).to respond_to(:you_lost)
      expect(strategy).to respond_to(:draw)
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
        expectations = [
          { grid_state: ['X', 'O', 2, 3, 4, 'X', 'O', 7, 8], empty_squares: [2, 3, 4, 7, 8] },
          { grid_state: [0, 'X', 'O', 3, 'O', 5, 6, 'X', 8], empty_squares: [0, 3, 5, 6, 8] },
          { grid_state: [0, 1, 2, 'X', 'O', 5, 'X', 7, 'O'], empty_squares: [0, 1, 2, 5, 7] }
        ]

        expectations.each do |test_case|
          # Arrange
          grid = double('grid', raw: test_case[:grid_state], empty_squares: test_case[:empty_squares])
          strategy = DumbAIStrategy.new

          # Act
          move = strategy.get_move(grid)

          # Assert
          expect(move).to be_included_in(*test_case[:empty_squares])
        end
      end
    end
  end
end
