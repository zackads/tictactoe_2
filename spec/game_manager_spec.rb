require 'game_manager'

RSpec.describe GameManager do
  context 'when the grid is full' do
    it 'the game is over' do
      # Arrange
      grid = double('Grid', full?: true)
      game = GameManager.new(grid: grid) # Positional argument

      # Act
      game_over = game.over?

      # Assert
      expect(game_over).to eq(true)
    end
  end
end
