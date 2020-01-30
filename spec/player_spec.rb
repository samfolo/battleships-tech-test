require 'player'

RSpec.describe Player do
  let(:test_ship) { double :ship, location: [[4, 0], [3, 0], [2, 0], [1, 0]] }
  let(:test_ship_class) { double :ship_class, new: test_ship }
  let(:test_board_instance) { double :board, render: empty_board, add_damage_coordinate: true }
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
    it 'is placed facing east by default' do
      confirmation = "Ship placed at A-1, East" + "\n"

      expect { test_player.place_ship 'A1' }.to output(confirmation).to_stdout
    end

    it 'is given when a ship is placed at B-2' do
      confirmation = "Ship placed at B-2, East" + "\n"

      expect { test_player.place_ship 'B2' }.to output(confirmation).to_stdout
    end

    it 'is given when a ship is placed at D-9' do
      confirmation = "Ship placed at D-9, East" + "\n"

      expect { test_player.place_ship 'D9' }.to output(confirmation).to_stdout
    end

    it 'is given when a ship is placed at G-10' do
      confirmation = "Ship placed at G-10, East" + "\n"

      expect { test_player.place_ship 'G10' }.to output(confirmation).to_stdout
    end
  end

  it 'keeps track of ship-count' do
    test_player.place_ship 'F4'

    expect(test_player.ship_count).to be 1
  end

  context 'keeping track of received shots' do
    it 'can take damage at coordinate A-1' do
      expect(test_board_instance).to receive(:add_damage_coordinate).with [0, 0]
      test_player.shot_at('A1')
    end

    it 'can take damage at a coordinate D-5' do
      expect(test_board_instance).to receive(:add_damage_coordinate).with [3, 4]
      test_player.shot_at('D5')
    end

    it 'can take damage at a coordinate F-6' do
      expect(test_board_instance).to receive(:add_damage_coordinate).with [5, 5]
      test_player.shot_at('F6')
    end

    it 'can take damage at a coordinate G-10' do
      expect(test_board_instance).to receive(:add_damage_coordinate).with [6, 9]
      test_player.shot_at('G10')
    end

    context 'a shot makes contact with a ship' do
      it 'alerts the player via the console' do
        test_player.place_ship 'E1', 'West'

        expect(STDOUT).to receive(:puts).with Player::HIT
        test_player.shot_at('C1')
      end
    end
  end
end
