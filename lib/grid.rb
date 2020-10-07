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

    raise ArgumentError, 'Invalid move: square already contains a piece' unless @grid[coords[0]][coords[1]].nil?

    @grid[coords[0]][coords[1]] = player_name
  end

  def winner
    return columns_winner if columns_winner
    return rows_winner if rows_winner
  end

  private

  def columns_winner
    @grid.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def rows_winner
    @grid.transpose.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def move_coords(coord)
    index_lookup = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      '1' => 2,
      '2' => 1,
      '3' => 0
    }

    raise ArgumentError, 'Invalid move: move out of range' unless index_lookup.has_key?(coord[0] && coord[1])

    [index_lookup[coord[1]], index_lookup[coord[0]]]
  end
end
