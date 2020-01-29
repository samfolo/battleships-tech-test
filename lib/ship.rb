class Ship
  def initialize coordinate
    @coordinate = coordinate
  end

  def location
    case @coordinate
    when 'A1' then [[0, 0], [1, 0], [2, 0], [3, 0]]
    when 'B8' then [[1, 7], [2, 7], [3, 7], [4, 7]]
    when 'C3' then [[2, 2], [3, 2], [4, 2], [5, 2]]
    when 'F10' then [[5, 9], [6, 9], [7, 9], [8, 9]]
    end
  end
end
