class Board
  def render ship = nil
    first_nine_lines = (1..9).to_a.map.with_index { |num, i| 
      ship&.location&.first == [0, 0] && i.zero? ? "| x x x x #{render_nodes 6} | #{num} "         :
      ship&.location&.first == [6, 3] && i == 3  ? "| #{render_nodes 6} x x x x | #{num} "         :
      ship&.location&.first == [1, 7] && i == 7  ? "| • x x x x #{render_nodes 5} | #{num} "       :
      ship&.location&.first == [4, 4] && i == 4  ? "| • • • • x x x x #{render_nodes 2} | #{num} " :
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
