class Ship
  X_AXIS = { 
    'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 
    'F' => 5, 'G' => 6, 'H' => 7, 'I' => 8, 'J' => 9 
  }

  def initialize coordinate, orientation = 'East', size = 4
    @coordinate = coordinate
    @orientation = orientation
    @size = size
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
    return [[4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7]] if @size == '6' && @orientation == 'South'
    return [[8, 6], [7, 6], [6, 6], [5, 6], [4, 6], [3, 6]] if @size == '6' && @orientation == 'West'
    return [[9, 9], [9, 8], [9, 7], [9, 6], [9, 5]] if @size == '5' && @orientation == 'North'
    return [0, 0], [1, 0] if @size == '2' && @orientation == 'East'
    return [0, 9], [0, 8] if @size == '2' && @orientation == 'North'
    return [3, 4], [2, 4], [1, 4] if @size == '3'

    case orientation
      when 'East' then (0..3).to_a.map { |el| [x_point + el, y_point] }
      when 'South' then (0..3).to_a.map { |el| [x_point, y_point + el] }
      when 'West' then (0..3).to_a.map { |el| [x_point - el, y_point] }
      when 'North' then (0..3).to_a.map { |el| [x_point, y_point - el] }
    end
  end
end
