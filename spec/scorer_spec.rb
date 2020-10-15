require 'scorer'
require 'grid'

RSpec.describe Scorer do
  before(:each) do
    # Arrange
    @grid = Grid.new
    @scorer = Scorer.new
  end

  context 'when a winning move is played on the top row' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'A3') # X
      @grid.record_move('O', 'B2') # O
      @grid.record_move('X', 'B3') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'C3') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    xit 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 'A3') # X
      @grid.record_move('X', 'B1') # O
      @grid.record_move('O', 'B3') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'C3') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played on the middle row' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'A2') # X
      @grid.record_move('O', 'B3') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'C2') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    xit 'declares O the winner' do
      # Arange
      @grid.record_move('O', 'A2') # X
      @grid.record_move('X', 'B3') # O
      @grid.record_move('O', 'B2') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'C2') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end
  context 'when a winning move is played on the bottom row' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'A1') # X
      @grid.record_move('O', 'B3') # O
      @grid.record_move('X', 'B1') # X
      @grid.record_move('O', 'C2') # O
      @grid.record_move('X', 'C1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('O', 'A1') # X
      @grid.record_move('X', 'B3') # O
      @grid.record_move('O', 'B1') # X
      @grid.record_move('X', 'C2') # O
      @grid.record_move('O', 'C1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played in the first column' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'A3') # X
      @grid.record_move('O', 'B2') # O
      @grid.record_move('X', 'A2') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'A1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    xit 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 'A3') # X
      @grid.record_move('X', 'B2') # O
      @grid.record_move('O', 'A2') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'A1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played in the second column' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'B3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'C1') # O
      @grid.record_move('X', 'B1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    xit 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 'B3') # X
      @grid.record_move('X', 'A2') # O
      @grid.record_move('O', 'B2') # X
      @grid.record_move('X', 'C1') # O
      @grid.record_move('O', 'B1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played in the third column' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'C3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'C2') # X
      @grid.record_move('O', 'B1') # O
      @grid.record_move('X', 'C1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    xit 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 'C3') # X
      @grid.record_move('X', 'A2') # O
      @grid.record_move('O', 'C2') # X
      @grid.record_move('X', 'B1') # O
      @grid.record_move('O', 'C1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when X plays a top left to bottom right winning diagonal is played' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'A3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'B1') # O
      @grid.record_move('X', 'C1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      expect(winner).to eq('X')
    end
  end

  context 'when X plays a top right to bottom left winning diagonal is played' do
    xit 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 'C3') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'B1') # O
      @grid.record_move('X', 'A1') # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end
  end

  context 'when O plays a top left to bottom right winning diagonal' do
    xit 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 'A3') # O
      @grid.record_move('X', 'A2') # X
      @grid.record_move('O', 'B2') # O
      @grid.record_move('X', 'B1') # X
      @grid.record_move('O', 'C1') # O - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when O plays a top right to bottom left winning diagonal' do
    xit 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 'C3') # O
      @grid.record_move('X', 'A2') # X
      @grid.record_move('O', 'B2') # O
      @grid.record_move('X', 'B1') # X
      @grid.record_move('O', 'A1') # O - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when there is no winner' do
    xit 'does not declare a winner' do
      # Arrange
      @grid.record_move('O', 'A1') # O
      @grid.record_move('X', 'B2') # X
      @grid.record_move('O', 'A2') # O
      @grid.record_move('X', 'C1') # X
      @grid.record_move('O', 'C3') # O

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq(nil)
    end
  end
end
