require_relative 'board'

class Player
  def initialize board = Board.new
    @board = board
  end

  def render_board
    @board.render
  end

  def place_ship coordinate
    puts "Ship placed at #{formatted coordinate}"
  end

  private

  def formatted coordinate
    coordinate.chars.join '-'
  end
end
