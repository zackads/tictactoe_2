require 'grid'

RSpec.describe Grid do
  context 'when a new grid is created' do
    it 'contains no moves' do
      # Arrange
      grid = Grid.new
      empty_grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]

      # Act
      grid_state = grid.raw

      # Assert
      expect(grid_state).to eq(empty_grid)
    end
  end

  context 'when a move is added' do
    it 'records that move in the correct position in the grid' do
      # Arrange
      grid = Grid.new
      grid.record_move('X', 0)
      grid.record_move('O', 1)
      grid.record_move('X', 2)
      grid.record_move('O', 7)
      expected_grid_state = ['X', 'O', 'X', 3, 4, 5, 6, 'O', 8]

      # Act
      grid_state = grid.raw

      # Assert
      expect(grid_state).to eq(expected_grid_state)
    end
  end

  context 'when an invalid move is added' do
    xit 'raises an argument exception' do
      # Act
      @grid.record_move('X', 0)

      # Assert
      expect { @grid.record_move('X', 0) }.to raise_error(ArgumentError) # Duplicate move
      expect { @grid.record_move('X', 9) }.to raise_error(ArgumentError) # Off-grid square
      expect { @grid.record_move('X', 'XYZ') }.to raise_error(ArgumentError) # Not a square
    end
  end

  context 'when the grid is full' do
    xit 'declares that the grid is full' do
      # Arrange
      @grid.record_move('X', 6) # X
      @grid.record_move('O', 7) # O
      @grid.record_move('X', 8) # X
      @grid.record_move('O', 3) # O
      @grid.record_move('X', 4) # X
      @grid.record_move('O', 5) # O
      @grid.record_move('X', 0) # X
      @grid.record_move('O', 1) # O
      @grid.record_move('X', 2) # X

      # Act
      is_grid_full = @grid.full?

      # Assert
      expect(is_grid_full).to eq(true)
    end
  end

  context 'when the grid is partially filled with moves' do
    xit 'declares which squares are empty' do
      expectations = [
        { moves: [3, 4, 5, 6, 7, 8], empty_squares: [0, 1, 2] },
        { moves: [1, 2, 6, 4], empty_squares: [0, 3, 5, 7, 8] },
        { moves: [6, 3, 7, 8, 1], empty_squares: [0, 2, 4, 5] }
      ]

      expectations.each do |test_case|
        # Arrange
        grid = Grid.new
        test_case[:moves].each_with_index do |move, index|
          player = index.odd? ? 'X' : 'O'
          grid.record_move(player, move)
        end

        # Act
        empty_squares = grid.empty_squares

        # Assert
        expect(empty_squares).to eq(test_case[:empty_squares])
      end
    end
  end
end
