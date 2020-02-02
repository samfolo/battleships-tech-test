require_relative 'board'
require_relative 'ship'

class Player
  HIT = 'Hit!'
  SHIP_SUNK = 'A ship has been sunken!'
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

  def place_ship coordinate, orientation = 'East', size = '4'
    if valid_placement(coordinate, orientation, size)
      @ships << new_ship_at(coordinate, orientation, size)
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
    chart_damage([x, y])
    hit?([x, y])
  end

  private

  def formatted coordinate
    "#{coordinate[0]}-#{coordinate[1..-1]}"
  end

  def new_ship_at coordinate, orientation, size
    @ship_class.new(coordinate, orientation, size)
  end

  def open_water? ship
    ship if ship.location&.all? { |coordinates| 
      @ships.all? { |ships| !ships.location.include? coordinates }
    }
  end
  
  def valid_coordinate? coordinate
    /\A([A-J])(10|[1-9])\Z/.match coordinate
  end

  def valid_placement coordinate, orientation, size
    valid_coordinate?(coordinate) && 
    open_water?(new_ship_at(coordinate, orientation, size))&.location
  end
  
  def hit? coordinate
    puts HIT if @ships.any? { |ship| ship.location.include? coordinate }
    remove_sunken_ship && puts(SHIP_SUNK) if @ships.any? { |ship| ship.sunk? }
  end

  def chart_damage coordinate
    @ships.each { |ship|
      ship.take_damage(coordinate) if ship.location&.include? coordinate
    }
  end

  def remove_sunken_ship
    @ships = @ships.reject { |ship| ship.sunk? }
  end
end
