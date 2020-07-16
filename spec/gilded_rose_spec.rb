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

  it "when still in date, change quality by 1" do 
      items = [Item.new("Eggs Benedict", 25, 12)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(24)
      expect(items[0].quality).to eq(11)
  end

end
