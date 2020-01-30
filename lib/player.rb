require_relative 'board'
require_relative 'ship'

class Player
  HIT = 'Hit!'
  CANNOT_PLACE_SHIP_HERE = 'You cannot make this placement, please choose another position.'
  X_AXIS = { 
    'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 
    'F' => 5, 'G' => 6, 'H' => 7, 'I' => 8, 'J' => 9 
  }

  def initialize board = Board.new, ships = [], ship_class = Ship
    @board = board
    @ships = ships
    @ship_class = ship_class
  end

  def render_board
    @board.render @ships
  end

  def place_ship coordinate, orientation = 'East'
    if valid_coordinate?(coordinate) && open_water?(new_ship_at(coordinate, orientation))&.location
      @ships << new_ship_at(coordinate, orientation)
      puts "Ship placed at #{formatted coordinate}, #{orientation}"
    else
      puts CANNOT_PLACE_SHIP_HERE
    end
  end

  def ship_count
    @ships.length
  end

  def attacked_at coordinate
    x = X_AXIS[coordinate[0]]
    y = coordinate[1..-1].to_i - 1
    @board.add_damage_coordinate([x, y])
    hit?([x, y])
  end

  private

  def formatted coordinate
    "#{coordinate[0]}-#{coordinate[1..-1]}"
  end

  def new_ship_at coordinate, orientation
    @ship_class.new(coordinate, orientation)
  end

  def valid_coordinate? coordinate
    /\A([A-J])(10|[1-9])\Z/.match coordinate
  end

  def open_water? ship
    ship if ship.location&.all? { |coordinates| 
      @ships.all? { |ships| !ships.location.include? coordinates }
    }
  end

  def hit? coordinate
    puts HIT if @ships.any? { |ship| ship.location.include? coordinate }
  end
end
