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

  it "checks that if the sell by date has passed, quality degrades twice as fast" do
    items = [Item.new("Eggs Benedict", 0, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(8)
  end

  # "Aged Brie" & Backstage Passes actually increases in Quality the older it gets

  it "brie increases quality with age" do
    items = [Item.new("Aged Brie", 5, 9)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(10)
  end

  it "backstage passes increase quality with age" do
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 3)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(4)
  end

# The Quality of an item is never more than 50

  xit 'quality is never more than 50' do
      items = [Item.new("Aged Brie", 5, 49)] 
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to_not eq(50)
    end


    # "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
  it 'Sulfuras never have to be sold or decrease quality' do
    items = [Item.new("Sulfuras, Hand of Ragnaros", 3, 7)] 
    GildedRose.new(items).update_quality()
    expect(items[0].sell_in).to eq(3)
    expect(items[0].quality).to eq(7)
  end

  end