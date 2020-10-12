# Record location of player moves on grid
class Grid
  def initialize
    @grid = [
      [nil, nil, nil], # 3
      [nil, nil, nil], # 2
      [nil, nil, nil]  # 1
      # A    B    C
    ]
    @index_lookup = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      '1' => 2,
      '2' => 1,
      '3' => 0
    }
  end

  def raw
    @grid
  end

  def record_move(player_name, coords)
    set_cell(coords, player_name)
  end

  def winner
    return columns_winner if columns_winner
    return rows_winner if rows_winner
    return diagonal_winner if diagonal_winner
  end

  private

  def validate_coords(coords)
    raise ArgumentError, 'Invalid move: cell out of range' unless @index_lookup.key?(coords[0] && coords[1])
  end

  def validate_move(coords)
    validate_coords(coords)
    raise ArgumentError, 'Invalid move: square already contains a piece' unless get_cell(coords).nil?
  end

  def translate_coords_to_indices(coords) # "A3"
    { col_index: @index_lookup[coords[0]], row_index: @index_lookup[coords[1]] }
  end

  def get_cell(coords)
    # Query: "A3" -> contents of "A3", e.g. "X", "O" or nil
    validate_coords(coords)

    col = translate_coords_to_indices(coords)[:col_index]
    row = translate_coords_to_indices(coords)[:row_index]

    @grid[row][col]
  end

  def set_cell(coords, marker)
    # Command: "A3" -> sets contents of "A3" to marker, e.g. 'X' or 'O'
    validate_move(coords)

    row = translate_coords_to_indices(coords)[:row_index]
    col = translate_coords_to_indices(coords)[:col_index]
    @grid[row][col] = marker
  end

  def columns_winner
    @grid.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def rows_winner
    @grid.transpose.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def diagonal_winner
    diagonals = [
      [@grid[0][2], @grid[1][1], @grid[2][0]],
      [@grid[0][0], @grid[1][1], @grid[2][2]]
    ]

    diagonals.each { |diagonal| return diagonal.first if diagonal.uniq.size <= 1 }
    nil
  end
end

# finish refactor of coords_valid? extract method
# all invalid exceptions in one place in one file
# record_move: array of moves to iterate over
