require 'player'

RSpec.describe Player do
  context 'when a new player is created' do
    it 'conforms to the player interface' do
      # Arrange
      move_strategy = double('strategy')
      player = Player.new('X', move_strategy)

      # Assert
      expect(player).to respond_to(:make_move).with(1).argument
      expect(player).to respond_to(:handle_outcome).with(1).argument
    end

    it 'recalls its token' do
      # Arrange
      move_strategy = double('cli') # Dummy object (doesn't respond to any messages)
      player = Player.new('X', move_strategy)

      # Act
      token = player.token

      # Assert
      expect(token).to eq('X')
    end
  end

  context 'when a move is requested' do
    it 'requests a move from its strategy object' do
      # Arrange
      move_strategy = spy('cli') # Spy (records that `make_move` was called)
      player = Player.new('X', move_strategy)
      grid = double('grid', record_move: nil)

      # Act
      player.make_move(grid)

      # Assert
      expect(move_strategy).to have_received(:get_move)
    end

    it 'records a move on the injected grid object' do
      # Arrange
      test_move = 5
      move_strategy = double('cli', get_move: test_move) # Stub (test double that responds to `get_move`)
      player = Player.new('X', move_strategy)
      grid = spy('grid')

      # Act
      player.make_move(grid)

      # Assert
      expect(grid).to have_received(:record_move).with('X', test_move)
    end
  end

  context 'when the strategy object returns an invalid move' do
    it 'requests a valid move from the strategy object' do
      # Arrange
      invalid_move = '13'
      move_strategy = spy('cli', get_move: invalid_move)
      allow(move_strategy).to receive(:invalid_move)

      grid = double('grid')
      allow(grid).to receive(:record_move).with('X', invalid_move).and_raise(ArgumentError)

      player = Player.new('X', move_strategy)

      # Act
      player.make_move(grid)

      # Assert
      expect(move_strategy).to have_received(:invalid_move).with(grid)
    end
  end

  context 'when player under test won' do
    it 'tells its strategy' do
      # Arrange
      move_strategy = spy('cli')
      player = Player.new('X', move_strategy)
      outcome = double('outcome', winner: player)

      # Act
      player.handle_outcome(outcome)

      # Assert
      expect(move_strategy).to have_received(:you_won)
    end
  end

  context 'when the game is over with no winner' do
    it 'tells its strategy' do
      # Arrange
      move_strategy = spy('cli')
      player = Player.new('X', move_strategy)
      outcome = double('outcome', winner: nil)

      # Act
      player.handle_outcome(outcome)

      # Assert
      expect(move_strategy).to have_received(:draw)
    end
  end

  context 'when the game is over and another player has won' do
    it 'tells its strategy' do
      # Arrange
      move_strategy = spy('cli')
      player = Player.new('X', move_strategy)
      another_player = double('another_player')
      outcome = double('outcome', winner: another_player)

      # Act
      player.handle_outcome(outcome)

      # Assert
      expect(move_strategy).to have_received(:you_lost)
    end
  end
end
