class Board
  def render ship = nil
    core_grid = (1..10).to_a.map.with_index { |_, y| 
      "| " + (1..10).to_a.map.with_index { |_, x| 
        ship&.location&.include?([x, y]) ? 'x' : '•'
      }.join(' ') + " | #{(y + 1).to_s.ljust 2, ' '}"
    }.join("\n")
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
end
