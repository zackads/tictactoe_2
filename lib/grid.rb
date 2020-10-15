# Record location of player moves on grid
class Grid
  def initialize
    # @grid = [
    #   [0, 1, 2], # 3
    #   [3, 4, 5], # 2
    #   [6, 7, 8]  # 1
    #   #A  B  C
    # ]

    @grid = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  end

  def raw
    @grid
  end

  def record_move(token, coords)
    set_cell(coords, token)
  end

  def full?
    !@grid.flatten.include?(nil)
  end

  private

  def validate_coords(coords)
    raise ArgumentError, 'Invalid move: cell out of range' unless @grid.include?(coords)
  end

  def validate_move(coords)
    validate_coords(coords)
    raise ArgumentError, 'Invalid move: square already contains a piece' unless get_cell(coords).is_a? Integer
  end

  def get_cell(coords)
    @grid[coords]
  end

  def set_cell(coords, token)
    # Command: "A3" -> sets contents of "A3" to marker, e.g. 'X' or 'O'
    validate_move(coords)

    @grid[coords] = token
  end
end
