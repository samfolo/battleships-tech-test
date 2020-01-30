class Ship
  X_AXIS = { 
    'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 
    'F' => 5, 'G' => 6, 'H' => 7, 'I' => 8, 'J' => 9 
  }

  def initialize coordinate, orientation = 'East'
    @coordinate = coordinate
    @orientation = orientation
  end

  def location
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

  def assigned_coordinates_by x_point, y_point, orientation
    case orientation
      when 'East' then (0..3).to_a.map { |el| [x_point + el, y_point] }
      when 'South' then (0..3).to_a.map { |el| [x_point, y_point + el] }
      when 'West' then (0..3).to_a.map { |el| [x_point - el, y_point] }
      when 'North' then (0..3).to_a.map { |el| [x_point, y_point - el] }
    end
  end
end
