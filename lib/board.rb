class Board
  def render ship = nil
    first_nine_lines = (1..9).to_a.map.with_index { |num, i| 
      ship && i.zero? ? "| x x x x #{render_nodes 6} | #{num} " :
      "| #{render_nodes 10} | #{num} "
    }.join("\n")
    tenth_line = "| • • • • • • • • • • | 10"
    
    [header, border, first_nine_lines, tenth_line, border].join("\n")
  end

  private

  def render_nodes num
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
