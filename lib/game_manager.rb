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

  def make_move(turn)
    [
      ["X", nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end
end