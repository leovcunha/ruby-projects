require "colorize"

class Tile
  attr_reader :bombed, :flagged
  attr_accessor :revealed

  def initialize(board, pos, bombed)
    @board = board
    @pos = pos
    @bombed = bombed
    @flagged = false
    @revealed = false
    @neighbor_directions = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]]
    @colors = [:light_black, :green, :light_blue, :yellow, :red, :dark_red ]
  end

  def reveal
    unless @revealed
      @revealed = true
      @flagged = false
      num_bombs = neighbor_bomb_count
      if num_bombs == 0
        self.neighbors.each { |neighbor| neighbor.reveal unless neighbor.revealed}
      end
    else
      puts "Tile is already revealed."
    end
  end

  def flag
    if @revealed
      puts "Can't flag a revealed tile"
      return
    end
    @flagged = !@flagged
  end

  def to_s
    string = ""
    if @bombed && @revealed
      string = "B "
    elsif  !@bombed && @revealed
      string = safe_bomb_string
    elsif @flagged
      string = "F ".colorize(:light_red)
    else
      string = "* "
    end
    string
  end

  def safe_bomb_string
    string = ""
    num_bombs = neighbor_bomb_count
    if num_bombs == 0
      string = "-".colorize(@colors[num_bombs])
    else
      string = num_bombs.to_s.colorize(@colors[num_bombs])
    end
    string += " "
  end

  def neighbors
    neighbor_arr = []
    @neighbor_directions.each do |dir|
      new_pos = [@pos[0] + dir[0], @pos[1] + dir[1]]
      neighbor_tile = @board[new_pos]
      neighbor_arr << neighbor_tile unless neighbor_tile.nil?
    end
    neighbor_arr
  end

  def neighbor_bomb_count
    neighbor_arr = neighbors
    num_bombs = 0
    neighbor_arr.each { |neighbor| num_bombs += 1 if neighbor.bombed }
    num_bombs
  end
end