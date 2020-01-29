class Board
  def render ships = []
    coordinates = []
    ships.each { |ship| coordinates.concat ship.location }
    core_grid = render_core_grid coordinates
    [header, border, core_grid, border].join("\n")
  end

  private

  def render_nodes num,
    line = []
    num.times { line << "•" }
    line.join ' '
  end

  def header
    "  A B C D E F G H I J     "
  end

  def border
    "+ - - - - - - - - - - +   "
  end

  def render_node_at x_coordinate, y_coordinate, coordinates
    coordinates.include?([x_coordinate, y_coordinate]) ? 'x' : '•'
  end

  def render_core_grid coordinates
    (1..10).to_a.map.with_index { |_, y| 
      "| " + (1..10).to_a.map.with_index { |_, x| 
        render_node_at x, y, coordinates
      }.join(' ') + " | #{(y + 1).to_s.ljust 2, ' '}"
    }.join("\n")
  end
end
