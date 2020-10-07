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
    set_cell(coords, player_name)
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

  def get_cell(coords)
    # Query: "A3" -> contents of "A3", e.g. "X", "O" or nil
    col = translate_coords_to_indices(coords)[:col_index]
    row = translate_coords_to_indices(coords)[:row_index]

    @grid[row][col]
  end

  def set_cell(coords, marker)
    # Command: "A3" -> sets contents of "A3" to marker, e.g. 'X' or 'O'

    raise ArgumentError, 'Invalid move: square already contains a piece' unless get_cell(coords).nil?

    row = translate_coords_to_indices(coords)[:row_index]
    col = translate_coords_to_indices(coords)[:col_index]
    @grid[row][col] = marker
  end

  def coords_valid?(coords)
    return false unless %w[A B C].include?(coords[0]) && %w[1 2 3].include?(coords[1])

    true
  end

  def translate_coords_to_indices(coords) # "A3"
    index_lookup = {
      'A' => 0,
      'B' => 1,
      'C' => 2,
      '1' => 2,
      '2' => 1,
      '3' => 0
    }
    raise ArgumentError, 'Invalid move: move out of range' unless index_lookup.key?(coords[0] && coords[1])

    { col_index: index_lookup[coords[0]], row_index: index_lookup[coords[1]] }
  end
end

# finish refactor of coords_valid? extract method
# all invalid exceptions in one place in one file
# record_move: array of moves to iterate over
