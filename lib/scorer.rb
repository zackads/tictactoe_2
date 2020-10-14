class Scorer
  def winner(grid)
    return columns_winner(grid) if columns_winner(grid)
    return rows_winner(grid) if rows_winner(grid)
    return diagonal_winner(grid) if diagonal_winner(grid)
  end

  private

  def columns_winner(grid)
    grid.raw.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def rows_winner(grid)
    grid.raw.transpose.each { |row| return row.first if row.uniq.size <= 1 }
    nil
  end

  def diagonal_winner(grid)
    diagonals = [
      [grid.raw[0][2], grid.raw[1][1], grid.raw[2][0]],
      [grid.raw[0][0], grid.raw[1][1], grid.raw[2][2]]
    ]

    diagonals.each { |diagonal| return diagonal.first if diagonal.uniq.size <= 1 }
    nil
  end
end
