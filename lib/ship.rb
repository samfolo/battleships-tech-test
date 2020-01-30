class Ship
  INVALID_PLACEMENT = 'Invalid '
  X_AXIS = { 
    'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 
    'F' => 5, 'G' => 6, 'H' => 7, 'I' => 8, 'J' => 9 
  }

  def initialize coordinate
    @coordinate = coordinate
  end

  def location
    x = X_AXIS[@coordinate[0]]
    y = @coordinate[1..-1].to_i - 1
    ship_coordinates = (0..3).to_a.map { |el| [x + el, y] }
    validate ship_coordinates
  end

  private

  def validate ship_coordinates
    ship_coordinates if ship_coordinates.flatten.all? { |coordinates| 
      (0..9).include? coordinates 
    }
  end
end
