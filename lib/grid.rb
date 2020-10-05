# Record location of player moves on grid
class Grid
  def initialize
    @grid = [
      [nil, nil, nil],
      [nil, nil, nil],
      [nil, nil, nil]
    ]
  end

  def raw
    @grid
  end

  def record_move(player_name, string_coordinates)
    coords = move_coords(string_coordinates)

    @grid[coords[0]][coords[1]] = player_name
  end

  private

  def move_coords(coord)
    index_lookup = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      '1' => 2,
      '2' => 1,
      '3' => 0
    }

    [index_lookup[coord[1]], index_lookup[coord[0]]]
  end
end
