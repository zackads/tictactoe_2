require 'game_manager'

RSpec.describe 'the class-based user interface' do
  describe GameManager do
    context 'when the current player makes a move' do
      it 'records that move in the correct position in the grid' do
        # Arrange
        grid = double('Grid', full?: false)
        scorer = double('Scorer', winner: nil, grid: grid)
        game = GameManager.new

        # Act
        game.make_move(0)

        # Assert
        expect(game.grid).to eq(['X', 1, 2, 3, 4, 5, 6, 7, 8])
      end
      xit 'records that move in the correct position in the grid' do
        # Arrange
        grid = double('Grid', full?: false)
        scorer = double('Scorer', winner: nil, grid: grid)
        game = GameManager.new

        # Act
        game.make_move(0)
        game.make_move(4)

        # Assert
        expect(game.grid).to eq(['X', 1, 2, 3, 'O', 5, 6, 7, 8])
      end
    end

    context 'when the grid is full' do
      it 'the game is over' do
        # Arrange
        grid = double('Grid', full?: true)
        scorer = double('Scorer', winner: nil, grid: grid)
        game = GameManager.new(grid: grid, scorer: scorer, players: [])

        # Act
        game_over = game.over?

        # Assert
        expect(game_over).to eq(true)
      end
    end

    context 'when the grid is not full but X is the winner' do
      it 'the game is over' do
        # Arrange
        grid = double('Grid', full?: false)
        scorer = double('Scorer', winner: 'X', grid: grid)
        game = GameManager.new(grid: grid, scorer: scorer)

        # Act
        game_over = game.over?

        # Assert
        expect(game_over).to eq(true)
      end
    end

    context 'when the grid is not full but O is the winner' do
      it 'the game is over' do
        # Arrange
        grid = double('Grid', full?: false)
        scorer = double('Scorer', winner: 'O', grid: grid)
        game = GameManager.new(grid: grid, scorer: scorer)

        # Act
        game_over = game.over?

        # Assert
        expect(game_over).to eq(true)
      end
    end

    context 'when the grid is full but X is the winner' do
      it 'the game is over' do
        # Arrange
        grid = double('Grid', full?: true)
        scorer = double('Scorer', winner: 'X', grid: grid)
        game = GameManager.new(grid: grid, scorer: scorer)

        # Act
        game_over = game.over?

        # Assert
        expect(game_over).to eq(true)
      end
    end

    context 'when the grid is full and O is the winner' do
      it 'the game is over' do
        # Arrange
        grid = double('Grid', full?: true)
        scorer = double('Scorer', winner: 'O', grid: grid)
        game = GameManager.new(grid: grid, scorer: scorer)

        # Act
        game_over = game.over?

        # Assert
        expect(game_over).to eq(true)
      end
    end

    context 'when a winning move is played by X' do
      it 'X is the winner' do
        # Arrange
        grid = double('Grid', full?: true)
        scorer = double('Scorer', winner: 'X', grid: grid)
        game = GameManager.new(grid: grid, scorer: scorer)

        # Act
        game_winner = game.winner

        # Assert
        expect(game_winner).to eq('X')
      end
    end

    context 'when a winning move is played by O' do
      it 'O is the winner' do
        # Arrange
        grid = double('Grid', full?: true)
        scorer = double('Scorer', winner: 'O', grid: grid)
        game = GameManager.new(grid: grid, scorer: scorer)

        # Act
        game_winner = game.winner

        # Assert
        expect(game_winner).to eq('O')
      end
    end
  end
end
