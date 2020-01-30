RSpec.describe "a player taking damage", type: :feature do
  let(:player_one) { Player.new }

  before(:each) do
    player_one.place_ship('J10', 'West')
    player_one.place_ship('F7', 'North')
    player_one.place_ship('B9')
    player_one.place_ship('A6', 'East')
    player_one.place_ship('E2', 'West')
    player_one.place_ship('J1', 'South')
  end

  scenario "a player's board is hit at G-2" do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • x | 1 "
    l4 =  "| • x x x x • ! • • x | 2 "
    l5 =  "| • • • • • • • • • x | 3 "
    l6 =  "| • • • • • x • • • x | 4 "
    l7 =  "| • • • • • x • • • • | 5 "
    l8 =  "| x x x x • x • • • • | 6 "
    l9 =  "| • • • • • x • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • x x x x • • • • • | 9 "
    l12 = "| • • • • • • x x x x | 10"
    l13 = "+ - - - - - - - - - - +   "

    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.shot_at('G2')

    expect(player_one.render_board).to eq board
  end

  scenario "a player's board is hit at B-7, F-1 and I-8" do
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • ! • • • x | 1 "
    l4 =  "| • x x x x • • • • x | 2 "
    l5 =  "| • • • • • • • • • x | 3 "
    l6 =  "| • • • • • x • • • x | 4 "
    l7 =  "| • • • • • x • • • • | 5 "
    l8 =  "| x x x x • x • • • • | 6 "
    l9 =  "| • ! • • • x • • • • | 7 "
    l10 = "| • • • • • • • • ! • | 8 "
    l11 = "| • x x x x • • • • • | 9 "
    l12 = "| • • • • • • x x x x | 10"
    l13 = "+ - - - - - - - - - - +   "

    board = [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")

    player_one.shot_at('B7')
    player_one.shot_at('F1')
    player_one.shot_at('I8')

    expect(player_one.render_board).to eq board
  end
end
