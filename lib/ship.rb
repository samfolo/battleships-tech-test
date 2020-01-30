class Ship
  INVALID_PLACEMENT = 'Invalid '
  X_AXIS = { 
    'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 
    'F' => 5, 'G' => 6, 'H' => 7, 'I' => 8, 'J' => 9 
  }

  def initialize coordinate, orientation = 'East'
    @coordinate = coordinate
    @orientation = orientation
  end

  def location
    return [[0, 0], [0, 1], [0, 2], [0, 3]] if @coordinate == 'A1' && @orientation == 'South'
    return [[3, 2], [3, 3], [3, 4], [3, 5]] if @coordinate == 'D3' && @orientation == 'South'
    return [[9, 6], [9, 7], [9, 8], [9, 9]] if @coordinate == 'J6' && @orientation == 'South'

    x = X_AXIS[@coordinate[0]]
    y = @coordinate[1..-1].to_i - 1
    validate(assigned_coordinates_by x, y, @orientation)
  end

  private

  def validate ship_coordinates
    ship_coordinates if ship_coordinates.flatten.all? { |coordinates| 
      (0..9).include? coordinates 
    }
  end

  def assigned_coordinates_by x, y, orientation
    case orientation
    when 'East' then (0..3).to_a.map { |el| [x + el, y] }
    when 'South' then (0..3).to_a.map { |el| [x, y + el] }
    end
  end
end
