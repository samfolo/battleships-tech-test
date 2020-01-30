require 'player'

RSpec.describe Player do
  let(:test_ship) { double :ship, location: [[0, 0], [1, 0], [2, 0], [3, 0]] }
  let(:test_ship_class) { double :ship_class, new: test_ship }
  let(:test_board_instance) { double :board, render: empty_board }
  let(:test_player) { Player.new test_board_instance, [], test_ship_class }
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

  it 'initially has 0 ships stored' do
    expect(test_player.ship_count).to be 0
  end

  describe 'confirmation of ship placement' do
    it 'is given when a ship is placed at B-2' do
      confirmation = "Ship placed at B-2" + "\n"

      expect { test_player.place_ship 'B2' }.to output(confirmation).to_stdout
    end

    it 'is given when a ship is placed at D-9' do
      confirmation = "Ship placed at D-9" + "\n"

      expect { test_player.place_ship 'D9' }.to output(confirmation).to_stdout
    end

    it 'is given when a ship is placed at G-10' do
      confirmation = "Ship placed at G-10" + "\n"

      expect { test_player.place_ship 'G10' }.to output(confirmation).to_stdout
    end
  end

  it 'keeps track of ship-count' do
    test_player.place_ship 'F4'

    expect(test_player.ship_count).to be 1
  end
end
