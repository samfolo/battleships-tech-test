class Board
  def render
    x_coordinates = "  A B C D E F G H I J     "
    border = "+ - - - - - - - - - - +   "
    first_nine_lines = (1..9).to_a.map { |num| "| #{render_nodes} | #{num} " }.join("\n")
    tenth_line = "| • • • • • • • • • • | 10"
    
    [x_coordinates, border, first_nine_lines, tenth_line, border].join("\n")
  end

  private

  def render_nodes
    line = []
    10.times { line << "•" }
    line.join ' '
  end
end
