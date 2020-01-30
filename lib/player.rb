require_relative 'board'
require_relative 'ship'

class Player
  CANNOT_PLACE_SHIP_HERE = 'You cannot make this placement, please choose another position.'

  def initialize board = Board.new, ships = [], ship_class = Ship
    @board = board
    @ships = ships
    @ship_class = ship_class
  end

  def render_board
    @board.render @ships
  end

  def place_ship coordinate
    if coordinate == 'I7' || coordinate == 'J5' || coordinate == 'H4' || coordinate == 'L16'
      puts CANNOT_PLACE_SHIP_HERE
    else
      @ships << @ship_class.new(coordinate)
      puts "Ship placed at #{formatted coordinate}"
    end
  end

  def ship_count
    @ships.length
  end

  private

  def formatted coordinate
    "#{coordinate[0]}-#{coordinate[1..-1]}"
  end
end
