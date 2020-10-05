require 'grid'

RSpec.describe Grid do
  context 'when a move is added by GameManager' do
    it 'records that move in the correct position in the grid' do
      # Arrange
      grid = Grid.new

      # Act
      grid.record_move('X', 'A3')
      grid.record_move('O', 'B3')
      grid.record_move('X', 'C3')
      grid.record_move('O', 'B1')

      # Assert
      expect(grid.raw).to eq(
        [%w[X O X], # 3
         [nil, nil, nil], # 2
         [nil, 'O', nil]] # 1
        # A    B    C
      )
    end
  end
end
