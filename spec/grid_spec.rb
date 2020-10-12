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

  context 'when a winning move is played on the top row' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'A3') # X
      @grid.record_move('O', 'B2') # O
      @grid.record_move('X', 'B3') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'C3') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end

    it 'declares O the winner' do
      # Act
      @grid.record_move('O', 'A3') # X
      @grid.record_move('X', 'B1') # O
      @grid.record_move('O', 'B3') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'C3') # X - winning move

      # Assert
      expect(@grid.winner).to eq('O')
    end
  end

  context 'when a winning move is played on the middle row' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'A2') # X
      @grid.record_move('O', 'B3') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'C2') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end

    it 'declares O the winner' do
      # Act
      @grid.record_move('O', 'A2') # X
      @grid.record_move('X', 'B3') # O
      @grid.record_move('O', 'B2') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'C2') # X - winning move

      # Assert
      expect(@grid.winner).to eq('O')
    end
  end
  context 'when a winning move is played on the bottom row' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'A1') # X
      @grid.record_move('O', 'B3') # O
      @grid.record_move('X', 'B1') # X
      @grid.record_move('O', 'C2') # O
      @grid.record_move('X', 'C1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end

    it 'declares X the winner' do
      # Act
      @grid.record_move('O', 'A1') # X
      @grid.record_move('X', 'B3') # O
      @grid.record_move('O', 'B1') # X
      @grid.record_move('X', 'C2') # O
      @grid.record_move('O', 'C1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('O')
    end
  end

  context 'when a winning move is played in the first column' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'A3') # X
      @grid.record_move('O', 'B2') # O
      @grid.record_move('X', 'A2') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'A1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end

    it 'declares O the winner' do
      # Act
      @grid.record_move('O', 'A3') # X
      @grid.record_move('X', 'B2') # O
      @grid.record_move('O', 'A2') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'A1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('O')
    end
  end

  context 'when a winning move is played in the second column' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'B3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'B1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end

    it 'declares O the winner' do
      # Act
      @grid.record_move('O', 'B3') # X
      @grid.record_move('X', 'A2') # O
      @grid.record_move('O', 'B2') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'B1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('O')
    end
  end

  context 'when a winning move is played in the third column' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'C3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'C2') # X
      @grid.record_move('O', 'B1') # O
      @grid.record_move('X', 'C1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end

    it 'declares O the winner' do
      # Act
      @grid.record_move('O', 'C3') # X
      @grid.record_move('X', 'A2') # O
      @grid.record_move('O', 'C2') # X
      @grid.record_move('X', 'B1') # O
      @grid.record_move('O', 'C1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('O')
    end
  end

  context 'when a top left to bottom right winning diagonal is played' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'A3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'B1') # O
      @grid.record_move('X', 'C1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end
  end

  context 'when a top right to bottom left winning diagonal is played' do
    it 'declares X the winner' do
      # Act
      @grid.record_move('X', 'C3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'B1') # O
      @grid.record_move('X', 'A1') # X - winning move

      # Assert
      expect(@grid.winner).to eq('X')
    end
  end

  context 'when there is no winner' do
    xit 'does not declare a winner' do
      # Act
      @grid.record_move('O', 'A1') # X
      @grid.record_move('X', 'B2') # O
      @grid.record_move('O', 'A2') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'C3') # X - winning move

      # Assert
      expect(@grid.winner).to eq(nil)
    end
  end
end
