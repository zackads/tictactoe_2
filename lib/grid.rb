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

  def record_move(token, square_number)
    set_square(square_number, token)
  end

  def full?
    @grid.none? { |square| square.is_a?(Integer) }
  end

  def empty_squares
    # Return grid squares that do not have an 'X' or 'O' on them
    @grid.select { |square| square != 'X' && square != 'O' }
  end

  private

  def validate_square(square_number)
    raise ArgumentError, 'Invalid move: cell out of range' unless square_number < @grid.size
  end

  def validate_move(square_number)
    validate_square(square_number)
    raise ArgumentError, 'Invalid move: square already contains a piece' unless get_square(square_number).is_a? Integer
  end

  def get_square(square_number)
    @grid[square_number]
  end

  def set_square(square_number, token)
    validate_move(square_number)

    @grid[square_number] = token
  end
end
