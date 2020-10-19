require 'scorer'
require 'grid'

RSpec.describe Scorer do
  before(:each) do
    # Arrange
    @grid = Grid.new
    @scorer = Scorer.new
  end

  context 'when a winning move is played on the top row' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 0) # X
      @grid.record_move('O', 4) # O
      @grid.record_move('X', 1) # X
      @grid.record_move('O', 8) # O
      @grid.record_move('X', 2) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    it 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 0) # X
      @grid.record_move('X', 7) # O
      @grid.record_move('O', 1) # X
      @grid.record_move('X', 8) # O
      @grid.record_move('O', 2) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played on the middle row' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 3) # X
      @grid.record_move('O', 1) # O
      @grid.record_move('X', 4) # X
      @grid.record_move('O', 8) # O
      @grid.record_move('X', 5) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    it 'declares O the winner' do
      # Arange
      @grid.record_move('O', 3) # X
      @grid.record_move('X', 1) # O
      @grid.record_move('O', 4) # X
      @grid.record_move('X', 8) # O
      @grid.record_move('O', 5) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end
  context 'when a winning move is played on the bottom row' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 6) # X
      @grid.record_move('O', 1) # O
      @grid.record_move('X', 7) # X
      @grid.record_move('O', 5) # O
      @grid.record_move('X', 8) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    it 'declares X the winner' do
      # Arrange
      @grid.record_move('O', 6) # X
      @grid.record_move('X', 1) # O
      @grid.record_move('O', 7) # X
      @grid.record_move('X', 5) # O
      @grid.record_move('O', 8) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played in the first column' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 0) # X
      @grid.record_move('O', 4) # O
      @grid.record_move('X', 3) # X
      @grid.record_move('O', 8) # O
      @grid.record_move('X', 6) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    it 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 0) # X
      @grid.record_move('X', 4) # O
      @grid.record_move('O', 3) # X
      @grid.record_move('X', 8) # O
      @grid.record_move('O', 6) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played in the second column' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 1) # X
      @grid.record_move('O', 3) # O
      @grid.record_move('X', 4) # X
      @grid.record_move('O', 8) # O
      @grid.record_move('X', 7) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    it 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 1) # X
      @grid.record_move('X', 3) # O
      @grid.record_move('O', 4) # X
      @grid.record_move('X', 8) # O
      @grid.record_move('O', 7) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when a winning move is played in the third column' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 2) # X
      @grid.record_move('O', 3) # O
      @grid.record_move('X', 5) # X
      @grid.record_move('O', 7) # O
      @grid.record_move('X', 8) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end

    it 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 2) # X
      @grid.record_move('X', 3) # O
      @grid.record_move('O', 5) # X
      @grid.record_move('X', 7) # O
      @grid.record_move('O', 8) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when X plays a top left to bottom right winning diagonal is played' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 0) # X
      @grid.record_move('O', 3) # O
      @grid.record_move('X', 4) # X
      @grid.record_move('O', 7) # O
      @grid.record_move('X', 8) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      expect(winner).to eq('X')
    end
  end

  context 'when X plays a top right to bottom left winning diagonal is played' do
    it 'declares X the winner' do
      # Arrange
      @grid.record_move('X', 2) # X
      @grid.record_move('O', 3) # O
      @grid.record_move('X', 4) # X
      @grid.record_move('O', 7) # O
      @grid.record_move('X', 6) # X - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('X')
    end
  end

  context 'when O plays a top left to bottom right winning diagonal' do
    it 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 2) # O
      @grid.record_move('X', 3) # X
      @grid.record_move('O', 4) # O
      @grid.record_move('X', 7) # X
      @grid.record_move('O', 6) # O - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when O plays a top right to bottom left winning diagonal' do
    it 'declares O the winner' do
      # Arrange
      @grid.record_move('O', 2) # O
      @grid.record_move('X', 3) # X
      @grid.record_move('O', 4) # O
      @grid.record_move('X', 7) # X
      @grid.record_move('O', 6) # O - winning move

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq('O')
    end
  end

  context 'when there is no winner' do
    it 'does not declare a winner' do
      # Arrange
      @grid.record_move('O', 6) # O
      @grid.record_move('X', 4) # X
      @grid.record_move('O', 3) # O
      @grid.record_move('X', 8) # X
      @grid.record_move('O', 2) # O

      # Act
      winner = @scorer.winner(@grid)

      # Assert
      expect(winner).to eq(nil)
    end
  end
end
