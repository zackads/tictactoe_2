class GameManager
  def initialize
    @grid =     [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end
  
  def grid
    @grid
  end 

  def make_move
  end
end

# make_move to take arguments and update current_game_state
# create current_game_state method which will then make 2nd acceptance test pass