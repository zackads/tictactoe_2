require 'game_manager'

RSpec.describe 'the class-based user interface' do
    describe GameManager do
        context 'when the current player makes a move' do
            it 'records that move in the correct position in the grid' do
                # Arrange
                game = GameManager.new

                # Assert 
                expect(game.make_move).to eq(nil)
            end
        end
    end
end