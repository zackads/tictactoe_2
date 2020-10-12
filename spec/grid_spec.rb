require 'grid'

RSpec.describe Grid do
  before(:each) do
    @grid = Grid.new
  end

  context 'when a new grid is created' do
    it '' do
      # Assert
      expect(@grid.raw).to eq(
        [[nil, nil, nil], # 3
         [nil, nil, nil], # 2
         [nil, nil, nil]] # 1
        # A    B    C
      )
    end
  end

  context 'when a move is added' do
    it 'records that move in the correct position in the grid' do
      # Act
      @grid.record_move('X', 'A3')
      @grid.record_move('O', 'B3')
      @grid.record_move('X', 'C3')
      @grid.record_move('O', 'B1')

      # Assert
      expect(@grid.raw).to eq(
        [%w[X O X], # 3
         [nil, nil, nil], # 2
         [nil, 'O', nil]] # 1
        # A    B    C
      )
    end
  end

  context 'when an invalid move is added' do
    it 'raises an argument exception' do
      # Act
      @grid.record_move('X', 'A3')

      # Assert
      expect { @grid.record_move('X', 'A3') }.to raise_error(ArgumentError) # Duplicate move
      expect { @grid.record_move('X', 'A4') }.to raise_error(ArgumentError) # Off-grid square
      expect { @grid.record_move('X', 'XYZ') }.to raise_error(ArgumentError) # Not a square
    end
  end

  context 'when the grid is full' do
    it 'declares that the grid is full' do
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
