require 'grid'

class GameManager
  attr_reader :grid

  def initialize
    @grid = Grid.new
    @current_player = 'X'
  end

  def grid
    @grid.raw
  end

  def make_move(move)
    @grid.record_move(@current_player, move)
    change_current_player
  end

  private

  def change_current_player
    @current_player = @current_player == 'X' ? 'O' : 'X'
  end
end

# make_move to take arguments and update current_game_state
# create current_game_state method which will then make 2nd acceptance test pass
