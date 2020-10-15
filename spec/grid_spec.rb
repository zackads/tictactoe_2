require 'grid'

RSpec.describe Grid do
  before(:each) do
    @grid = Grid.new
  end

  context 'when a new grid is created' do
    it '' do
      # Assert
      expect(@grid.raw).to eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end
  end

  context 'when a move is added' do
    it 'records that move in the correct position in the grid' do
      # Act
      @grid.record_move('X', 0)
      @grid.record_move('O', 1)
      @grid.record_move('X', 2)
      @grid.record_move('O', 7)

      # Assert
      expect(@grid.raw).to eq(['X', 'O', 'X', 3, 4, 5, 6, 'O', 8])
    end
  end

  context 'when an invalid move is added' do
    xit 'raises an argument exception' do
      # Act
      @grid.record_move('X', 'A3')

      # Assert
      expect { @grid.record_move('X', 'A3') }.to raise_error(ArgumentError) # Duplicate move
      expect { @grid.record_move('X', 'A4') }.to raise_error(ArgumentError) # Off-grid square
      expect { @grid.record_move('X', 'XYZ') }.to raise_error(ArgumentError) # Not a square
    end
  end

  context 'when the grid is full' do
    xit 'declares that the grid is full' do
      # Arrange
      @grid.record_move('X', 'A1') # X
      @grid.record_move('O', 'B1') # O
      @grid.record_move('X', 'C1') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'C2') # O
      @grid.record_move('X', 'A3') # X
      @grid.record_move('O', 'B3') # O
      @grid.record_move('X', 'C3') # X

      # Act
      is_grid_full = @grid.full?

      # Assert
      expect(is_grid_full).to eq(true)
    end
  end
end
