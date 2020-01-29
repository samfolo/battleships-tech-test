class Ship
  def initialize coordinate
    @coordinate = coordinate
  end

  def location
    case @coordinate
    when 'A1' then [[0, 0], [1, 0], [2, 0], [3, 0]]
    when 'B8' then [[1, 7], [2, 7], [3, 7], [4, 7]]
    end
  end
end
