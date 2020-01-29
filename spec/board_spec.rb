require 'board'

RSpec.describe Board do
  let(:test_board) { Board.new }
  let(:test_ship_one) { double :ship, location: [[0, 0], [1, 0], [2, 0], [3, 0]] }
  let(:test_ship_two) { double :ship, location: [[6, 3], [7, 3], [8, 3], [9, 3]] }
  let(:empty_board) {
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
    
    [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")
  }

  let(:test_board_one) {
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
    
    [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")
  }

  let(:test_board_two) {
    l1 =  "  A B C D E F G H I J     "
    l2 =  "+ - - - - - - - - - - +   "
    l3 =  "| • • • • • • • • • • | 1 "
    l4 =  "| • • • • • • • • • • | 2 "
    l5 =  "| • • • • • • • • • • | 3 "
    l6 =  "| • • • • • • x x x x | 4 "
    l7 =  "| • • • • • • • • • • | 5 "
    l8 =  "| • • • • • • • • • • | 6 "
    l9 =  "| • • • • • • • • • • | 7 "
    l10 = "| • • • • • • • • • • | 8 "
    l11 = "| • • • • • • • • • • | 9 "
    l12 = "| • • • • • • • • • • | 10"
    l13 = "+ - - - - - - - - - - +   "
    
    [l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13].join("\n")
  }

  it 'at first renders itself with no ships' do
    expect(subject.render).to eq empty_board
  end

  describe '#render' do
    it 'renders a single ship passed as an argument by its coordinates' do
      expect(subject.render test_ship_one).to eq test_board_one
    end

    it 'renders a different ship passed as an argument by its coordinates' do
      expect(subject.render test_ship_two).to eq test_board_two
    end
  end 
end
