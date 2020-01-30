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

  scenario 'a player attempts to place their ship at J-5' do
    expect(STDOUT).to receive(:puts).with Player::CANNOT_PLACE_SHIP_HERE
    player_one.place_ship('J5')
  end
end
