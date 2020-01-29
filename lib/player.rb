require_relative 'board'
require_relative 'ship'

class Player
  def initialize board = Board.new, ships = [], ship_class = Ship
    @board = board
    @ships = ships
    @ship_class = ship_class
  end

  def render_board
    @board.render @ships
  end

  def place_ship coordinate
    @ships << @ship_class.new(coordinate)
    puts "Ship placed at #{formatted coordinate}"
  end

  def ship_count
    @ships.length
  end

  private

  def formatted coordinate
    coordinate.chars.join '-'
  end
end
