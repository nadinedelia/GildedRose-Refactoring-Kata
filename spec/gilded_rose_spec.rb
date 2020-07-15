require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do

    it "does not change the name" do
      p items = [Item.new("pasta", 2, 5)]
      p GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "pasta"
    end
  end

  it "changes the Sell-in value by 1" do 

  end

end
