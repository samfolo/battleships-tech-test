require_relative 'board'
require_relative 'ship'

class Player
  def initialize board = Board.new, ships = []
    @board = board
    @ships = ships
  end

  def render_board
    @board.render
  end

  def place_ship coordinate
    puts "Ship placed at #{formatted coordinate}"
  end

  def store_ship ship
    @ships << ship
  end

  def ship_count
    @ships.length
  end

  private

  def formatted coordinate
    coordinate.chars.join '-'
  end
end
