require_relative("tile")

class Board
  attr_reader :grid, :size
  def initialize(size = 9)
    @size = size
    @grid = []

    populate_grid
  end

  def populate_grid
    @num_bombs = @size * @size / 4
    list = []
    @num_bombs.times { list << true }
    ((@size * @size) - @num_bombs).times { list << false }
    list.shuffle!

    (0...@size).each do |i|
      row = []
      (0...@size).each {|j| row << Tile.new(self, [i, j], list.shift)} 
      @grid << row
    end
  end

  def [](pos)
    return nil unless valid_pos?(pos)
    r, c = pos
    @grid[r][c]
  end

  def valid_pos?(pos)
    r, c = pos
    r < @size && c < @size && r >= 0 && c >= 0
  end

  def reveal(pos)
    self[pos].reveal
  end

  def flag(pos)
    self[pos].flag
  end

  def reveal_all
    @grid.each do |row|
      row.each do |tile|
        tile.reveal unless tile.revealed
      end
    end
  end

  def render
    system("clear")
    string = "\n  " + (0...@size).to_a.join(" ") + "\n"
    (0...@size).each do |i|
      row = "#{i} "
      (0...@size).each do |j|
        tile = self[[i, j]]
        row << tile.to_s
      end
      string << row
      string << "\n"
    end
    string << "\n"
    puts string
  end
end