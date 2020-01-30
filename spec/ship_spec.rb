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

  describe "a ship's orientation (West, South and East)" do
    context 'South' do
      it 'holds the coordinates [0, 0], [0, 1], [0, 2] and [0, 3] when passed A1 and South' do
        test_ship = Ship.new('A1', 'South')
        expect(test_ship.location).to eq [[0, 0], [0, 1], [0, 2], [0, 3]]
      end

      it 'holds the coordinates [3, 2], [3, 3], [3, 4] and [3, 5] when passed D3 and South' do
        test_ship = Ship.new('D3', 'South')
        expect(test_ship.location).to eq [[3, 2], [3, 3], [3, 4], [3, 5]]
      end

      it 'holds the coordinates [[9, 6], [9, 7], [9, 8] and [9, 9]] when passed J7 and South' do
        test_ship = Ship.new('J7', 'South')
        expect(test_ship.location).to eq [[9, 6], [9, 7], [9, 8], [9, 9]]
      end

      it 'holds the coordinates [[4, 1], [4, 2], [4, 3] and [4, 4]] when passed J6 and South' do
        test_ship = Ship.new('E2', 'South')
        expect(test_ship.location).to eq [[4, 1], [4, 2], [4, 3], [4, 4]]
      end

      it 'holds the coordinates [[4, 1], [4, 2], [4, 3] and [4, 4]] when passed J6 and South' do
        test_ship = Ship.new('E2', 'South')
        expect(test_ship.location).to eq [[4, 1], [4, 2], [4, 3], [4, 4]]
      end
    end

    context 'West' do
      it 'holds the coordinates [[9, 0], [8, 0], [7, 0] and [6, 0]] when passed A10 and West' do
        test_ship = Ship.new('A10', 'West')
        expect(test_ship.location).to eq [[9, 0], [8, 0], [7, 0], [6, 0]]
      end

      it 'holds the coordinates [[7, 3], [6, 3], [5, 3] and [4, 3]] when passed H4 and West' do
        test_ship = Ship.new('H4', 'West')
        expect(test_ship.location).to eq [[7, 3], [6, 3], [5, 3], [4, 3]]
      end
    end
  end 
end
