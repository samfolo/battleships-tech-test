require 'board'

RSpec.describe Board do
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

  it 'at first renders itself with no ships' do
    expect(subject.render).to eq empty_board
  end
end
