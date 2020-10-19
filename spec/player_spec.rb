require 'player'

RSpec.describe Player do
  context 'when a new player is created' do
    it 'conforms to the player interface' do
      # Arrange
      move_strategy = double('strategy')
      player = Player.new('X', move_strategy)

      # Assert
      expect(player).to respond_to(:make_move).with(1).argument
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
end
