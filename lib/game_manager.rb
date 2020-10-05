class GameManager
  def initialize
    @grid = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  attr_reader :grid

  def make_move(_move)
    @grid = [
      ['X', nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end
end

# make_move to take arguments and update current_game_state
# create current_game_state method which will then make 2nd acceptance test pass
