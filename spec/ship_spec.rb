require 'ship'

RSpec.describe Ship do
  it 'holds the coordinates [0, 0], [1, 0], [2, 0] and [3, 0] when passed A1' do
    test_ship = Ship.new('A1')
    expect(test_ship.location).to eq [[0, 0], [1, 0], [2, 0], [3, 0]]
  end

  it 'holds the coordinates [1, 7], [2, 7], [3, 7] and [4, 7] when passed B8' do
    test_ship = Ship.new('B8')
    expect(test_ship.location).to eq [[1, 7], [2, 7], [3, 7], [4, 7]]
  end

  it 'holds the coordinates [2, 2], [3, 2], [4, 2] and [5, 2] when passed C3' do
    test_ship = Ship.new('C3')
    expect(test_ship.location).to eq [[2, 2], [3, 2], [4, 2], [5, 2]]
  end

  it 'holds the coordinates [5, 9], [6, 9], [7, 9] and [8, 9] when passed F10' do
    test_ship = Ship.new('F10')
    expect(test_ship.location).to eq [[5, 9], [6, 9], [7, 9], [8, 9]]
  end
end
