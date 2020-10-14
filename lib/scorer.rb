class Scorer
  attr_accessor :grid

  def initialize(grid = nil)
    @grid = grid
  end

  def winner
    return columns_winner if columns_winner
    return rows_winner if rows_winner
    return diagonal_winner if diagonal_winner
  end

  private

  def columns_winner
    @grid.raw.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def rows_winner
    @grid.raw.transpose.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def diagonal_winner
    diagonals = [
      [@grid.raw[0][2], @grid.raw[1][1], @grid.raw[2][0]],
      [@grid.raw[0][0], @grid.raw[1][1], @grid.raw[2][2]]
    ]

    diagonals.each { |diagonal| return diagonal.first if diagonal.uniq.size <= 1 }
    nil
  end
end
