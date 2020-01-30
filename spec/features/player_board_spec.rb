RSpec.describe "a player's board", type: :feature do
  let(:player_one) { Player.new }

  scenario 'a player has no ships and views their board' do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • • | 1 "
    l4 =  "| • • • • • • • • • • | 2 "
    l5 =  "| • • • • • • • • • • | 3 "
    l6 =  "| • • • • • • • • • • | 4 "
    l7 =  "| • • • • • • • • • • | 5 "
    l8 =  "| • • • • • • • • • • | 6 "
    l9 =  "| • • • • • • • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    empty_board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    expect(player_one.render_board).to eq empty_board
  end

  scenario 'a player places a ship at A-1 and views their board' do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| x x x x • • • • • • | 1 "
    l4 =  "| • • • • • • • • • • | 2 "
    l5 =  "| • • • • • • • • • • | 3 "
    l6 =  "| • • • • • • • • • • | 4 "
    l7 =  "| • • • • • • • • • • | 5 "
    l8 =  "| • • • • • • • • • • | 6 "
    l9 =  "| • • • • • • • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.place_ship('A1')

    expect(player_one.render_board).to eq board
  end

  scenario 'a player places a ship at B-2 and another at G7 and views their board' do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • • | 1 "
    l4 =  "| • x x x x • • • • • | 2 "
    l5 =  "| • • • • • • • • • • | 3 "
    l6 =  "| • • • • • • • • • • | 4 "
    l7 =  "| • • • • • • • • • • | 5 "
    l8 =  "| • • • • • • • • • • | 6 "
    l9 =  "| • • • • • • • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • x x x x | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.place_ship('B2')
    player_one.place_ship('G10')

    expect(player_one.render_board).to eq board
  end

  scenario 'a player places a ship at I-3 facing south and views their board' do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • • | 1 "
    l4 =  "| • • • • • • • • • • | 2 "
    l5 =  "| • • • • • • • • x • | 3 "
    l6 =  "| • • • • • • • • x • | 4 "
    l7 =  "| • • • • • • • • x • | 5 "
    l8 =  "| • • • • • • • • x • | 6 "
    l9 =  "| • • • • • • • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.place_ship('I3', 'South')

    expect(player_one.render_board).to eq board
  end

  context 'placements outside of the constraints of the board' do
    before(:each) do
      expect(STDOUT).to receive(:puts).with Player::CANNOT_PLACE_SHIP_HERE
    end
    
    after(:each) do
      expect(player_one.ship_count).to be 0
    end

    scenario 'a player attempts to place their ship at J-5' do
      player_one.place_ship 'J5'
    end

    scenario 'a player attempts to place their ship at I-7' do
      player_one.place_ship 'I7'
    end

    scenario 'a player attempts to place their ship at H-4' do
      player_one.place_ship 'H4'
    end

    scenario 'a player attempts to place their ship at L-16' do
      player_one.place_ship 'L16'
    end

    scenario 'a player attempts to place their ship at AA-8' do
      player_one.place_ship 'AA8'
    end
  end

  context 'overlapping ships' do
    after(:each) do
      expect(player_one.ship_count).to be 1
    end

    scenario 'a player attempts to place their ship at A-1 after placing a ship at C-1' do
      player_one.place_ship 'A1'
      
      expect(STDOUT).to receive(:puts).with Player::CANNOT_PLACE_SHIP_HERE
      player_one.place_ship 'C1'
    end

    scenario 'a player attempts to place their ship at B-8 after placing a ship at E-8' do
      player_one.place_ship 'B8'
      
      expect(STDOUT).to receive(:puts).with Player::CANNOT_PLACE_SHIP_HERE
      player_one.place_ship 'E8'
    end

    scenario 'a player attempts to place their ship at F-5 after placing a ship at F-5' do
      player_one.place_ship 'F5'
      
      expect(STDOUT).to receive(:puts).with Player::CANNOT_PLACE_SHIP_HERE
      player_one.place_ship 'F5'
    end
  end
end
