require 'game_manager'

RSpec.describe GameManager do
  context 'when a new game is started' do
    context 'and there are two players' do
      it 'requests a move from the first player' do
        # Arrange
        player1 = spy('player_that_goes_first')
        player2 = spy('player_that_goes_second')
        grid = double('grid')
        allow(grid).to receive(:full?).and_return(false, true)
        scorer = double('scorer', winner: nil)
        game = GameManager.new(players: [player1, player2], grid: grid, scorer: scorer)

        # Act
        game.play

        # Assert
        expect(player1).to have_received(:make_move)
      end

      it 'it requests a move from the second player' do
        # Arrange
        player1 = spy('player_that_goes_first')
        player2 = spy('player_that_goes_second')
        grid = double('grid', full?: false)
        allow(grid).to receive(:full?).and_return(false, false, true)
        scorer = double('scorer', winner: nil)
        game = GameManager.new(players: [player1, player2], grid: grid, scorer: scorer)

        # Act
        game.play

        # Assert
        expect(player2).to have_received(:make_move)
      end

      context 'when the grid is full after each player moves 3 times' do
        it 'requests no more moves' do
          # Arrange
          player1 = spy('player_that_goes_first')
          player2 = spy('player_that_goes_second')
          grid = double('grid', full?: false)
          scorer = double('scorer', winner: nil)
          allow(grid).to receive(:full?).and_return(false, false, false, false, false, false, true)

          game = GameManager.new(grid: grid, players: [player1, player2], scorer: scorer)

          # Act
          game.play

          # Assert
          expect(player1).to have_received(:make_move).exactly(3).times
          expect(player2).to have_received(:make_move).exactly(3).times
        end
      end

      context 'when player1 is the winner after each player moves 3 times' do
        it 'requests no more moves' do
          # Arrange
          player1 = spy('player_that_goes_first')
          player2 = spy('player_that_goes_second')
          grid = double('grid', full?: false)
          scorer = double('scorer')
          allow(scorer).to receive(:winner).and_return(nil, nil, nil, nil, nil, nil, player1)

          game = GameManager.new(grid: grid, players: [player1, player2], scorer: scorer)

          # Act
          game.play

          # Assert
          expect(player1).to have_received(:make_move).exactly(3).times
          expect(player2).to have_received(:make_move).exactly(3).times
        end
      end

      context 'when player2 is the winner after each player moves 3 times' do
        it 'requests no more moves' do
          # Arrange
          player1 = spy('player_that_goes_first')
          player2 = spy('player_that_goes_second')
          grid = double('grid', full?: false)
          scorer = double('scorer')
          allow(scorer).to receive(:winner).and_return(nil, nil, nil, nil, nil, nil, player2)

          game = GameManager.new(grid: grid, players: [player1, player2], scorer: scorer)

          # Act
          game.play

          # Assert
          expect(player1).to have_received(:make_move).exactly(3).times
          expect(player2).to have_received(:make_move).exactly(3).times
        end
      end

      context 'when player1 is the winner after player1 plays 3 moves and player2 plays 2 moves' do
        it 'requests no more moves' do
          # Arrange
          player1 = spy('player_that_goes_first')
          player2 = spy('player_that_goes_second')
          grid = double('grid', full?: false)
          scorer = double('scorer')
          allow(scorer).to receive(:winner).and_return(nil, nil, nil, nil, nil, player1)

          game = GameManager.new(grid: grid, players: [player1, player2], scorer: scorer)

          # Act
          game.play

          # Assert
          expect(player1).to have_received(:make_move).exactly(3).times
          expect(player2).to have_received(:make_move).exactly(2).times
        end
      end

      context 'when the grid is full but X is the winner' do
        it 'requests no more moves' do
          # Arrange
          player1 = spy('player_that_goes_first')
          player2 = spy('player_that_goes_second')
          grid = double('grid')
          scorer = double('scorer')
          allow(grid).to receive(:full?).and_return(false, false, false, false, false, false, false, false, false, true)
          allow(scorer).to receive(:winner).and_return(nil, nil, nil, nil, nil, nil, nil, nil, nil, player1)
          game = GameManager.new(grid: grid, players: [player1, player2], scorer: scorer)

          # Act
          game.play

          # Assert
          expect(player1).to have_received(:make_move).exactly(5).times
          expect(player2).to have_received(:make_move).exactly(4).times
        end
      end
    end
  end
end

# ===================================================================================

RSpec.describe 'old GameManager unit tests' do
  context 'when the grid is full and O is the winner' do
    xit 'the game is over' do
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
    xit 'X is the winner' do
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
    xit 'O is the winner' do
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
