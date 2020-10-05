require 'game_manager'

RSpec.describe 'the class-based user interface' do
  describe GameManager do
    context 'when the user creates a new game by instantiating the GameManager class' do
      it 'creates a blank grid' do
        # Arrange
        game = GameManager.new

        # Assert
        expect(game.grid).to eq([
                                  [nil, nil, nil],
                                  [nil, nil, nil],
                                  [nil, nil, nil]
                                ])
      end
    end

    # context 'when a new game is started' do
    #   it 'records moves from players' do
    #     # Arrange
    #     game = GameManager.new

    #     # Assert
    #     expect(game.current_game_state).to eq([
    #                               ["X", nil, nil],
    #                               [nil, "O", nil], 
    #                               ["X", nil, nil]
    #                             ])
    #   end
    # end
  end
end
