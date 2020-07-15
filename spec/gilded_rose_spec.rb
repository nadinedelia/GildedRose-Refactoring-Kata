require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do

    it "does not change the name" do
      items = [Item.new("Pasta", 2, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Pasta"
    end
  end

  it "changes the Sell-in value by 1" do 
      items = [Item.new("Pizza", 10, 12)]
      GildedRose.new(items).update_quality()
      expect { GildedRose.new(items).update_quality() }.to change { items[0].sell_in }.by(-1)
  end

end
