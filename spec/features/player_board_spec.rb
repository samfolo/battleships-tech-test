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

  scenario 'a player places a ship at I-3 (facing South) and views their board' do
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

  scenario 'a player places a ship at F-4 (facing South) and views their board' do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • • | 1 "
    l4 =  "| • • • • • • • • • • | 2 "
    l5 =  "| • • • • • • • • • • | 3 "
    l6 =  "| • • • • • x • • • • | 4 "
    l7 =  "| • • • • • x • • • • | 5 "
    l8 =  "| • • • • • x • • • • | 6 "
    l9 =  "| • • • • • x • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.place_ship('F4', 'South')

    expect(player_one.render_board).to eq board
  end

  scenario 'a player places a ship at C2, another at F-4 (facing South) then views their board' do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • • | 1 "
    l4 =  "| • • x x x x • • • • | 2 "
    l5 =  "| • • • • • • • • • • | 3 "
    l6 =  "| • • • • • x • • • • | 4 "
    l7 =  "| • • • • • x • • • • | 5 "
    l8 =  "| • • • • • x • • • • | 6 "
    l9 =  "| • • • • • x • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.place_ship('C2')
    player_one.place_ship('F4', 'South')

    expect(player_one.render_board).to eq board
  end

  scenario 'a player places a ship at H-7 facing West, another at D-7 (facing North, then views their board' do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • • | 1 "
    l4 =  "| • • • • • • • • • • | 2 "
    l5 =  "| • • • • • • • • • • | 3 "
    l6 =  "| • • • x • • • • • • | 4 "
    l7 =  "| • • • x • • • • • • | 5 "
    l8 =  "| • • • x • • • • • • | 6 "
    l9 =  "| • • • x x x x x • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.place_ship('H7', 'West')
    player_one.place_ship('D7', 'North')

    expect(player_one.render_board).to eq board
  end

  context 'choosing sizes' do
    scenario 'a player places a West-facing ship of length 2 at C-1 then views their board' do
      l01 = "  A B C D E F G H I J     "
      l02 = "+ - - - - - - - - - - +   "
      l03 = "| • x x • • • • • • • | 1 "
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

      board = [l01, l02, l03, l04, l05, l06, l07, l08, l09, l10, l11, l12, l13].join("\n")

      player_one.place_ship 'C1', 'West', '2'

      expect(player_one.render_board).to eq board
    end
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

    context 'intersecting ships' do
      scenario 'a player attempts to place a North-facing ship at H-6 after placing a ship at F-5' do
        player_one.place_ship 'F5'
        
        expect(STDOUT).to receive(:puts).with Player::CANNOT_PLACE_SHIP_HERE
        player_one.place_ship 'H6', 'North'
      end
  
      scenario 'a player attempts to place a South-facing ship at C-7 after placing a West-facing ship at E-9' do
        player_one.place_ship 'E9', 'West'
        
        expect(STDOUT).to receive(:puts).with Player::CANNOT_PLACE_SHIP_HERE
        player_one.place_ship 'C7', 'South'
      end
    end
  end
end
