# Record location of player moves on grid
class Grid
  def initialize
    @grid = [
      [nil, nil, nil], # 3
      [nil, nil, nil], # 2
      [nil, nil, nil]  # 1
      # A    B    C
    ]
  end

  def raw
    @grid
  end

  def record_move(player_name, coords)
    indices = translate_coords_to_indices(coords)
    p(indices)

    unless @grid[indices[:col_index]][indices[:row_index]].nil?
      raise ArgumentError, 'Invalid move: square already contains a piece'
    end

    @grid[indices[:col_index]][indices[:row_index]] = player_name
  end

  def winner
    return columns_winner if columns_winner
    return rows_winner if rows_winner

    return 'X' if @grid[0][0] == 'X' && @grid[1][1] == 'X' && @grid[2][2]
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

  # def get_cell(coords)
  #   # Query: "A3" -> contents of "A3", e.g. "X", "O" or nil
  #   col_index = move_coords(coords)[0]
  #   row_index = move_coords(coords)[1]

  #   @grid[col_index][row_index]
  # end

  # def set_cell(coords, marker)
  #   # Command: "A3" -> sets contents of "A3" to marker, e.g. 'X' or 'O'
  # end

  def translate_coords_to_indices(coords)
    index_lookup = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      '1' => 2,
      '2' => 1,
      '3' => 0
    }
    raise ArgumentError, 'Invalid move: move out of range' unless index_lookup.key?(coords[0] && coords[1])

    { col_index: index_lookup[coords[1]], row_index: index_lookup[coords[0]] }
  end
end
