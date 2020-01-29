require_relative 'board'

class Player
  def initialize board = Board.new
    @board = board
  end

  def render_board
    @board.render
  end
end
