require 'player'

RSpec.describe Player do
  let(:test_board_instance) { double :board, render: empty_board }
  let(:test_player) { Player.new test_board_instance }
  let(:empty_board) {
    l01 = "  A B C D E F G H I J     "
    l02 = "+ - - - - - - - - - - +   "
    l03 = "| • • • • • • • • • • | 1 "
    l04 = "| • • • • • • • • • • | 2 "
    l05 = "| • • • • • • • • • • | 3 "
    l06 = "| • • • • • • • • • • | 4 "
    l07 = "| • • • • • • • • • • | 5 "
    l08 = "| • • • • • • • • • • | 6 "
    l09 = "| • • • • • • • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "

    [l01, l02, l03, l04, l05, l06, l07, l08, l09, l10, l11, l12, l13].join("\n")
  }

  it 'begins with an empty board' do
    expect(test_player.render_board).to eq empty_board
  end

  it 'can place a ship on its board' do
    confirmation = "Ship placed at B-2" + "\n"

    expect { test_player.place_ship('B2') }.to output(confirmation).to_stdout
  end
end
