require 'gilded_rose'
require 'item'

describe GildedRose do

  describe "#update_quality" do


    # GENERAL

    it "does not change the name" do
      items = [Item.new("Elixir of the Mongoose", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Elixir of the Mongoose"
    end

  it "when still in date, change quality by 1" do 
      items = [Item.new("Elixir of the Mongoose", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(9)
      expect(items[0].quality).to eq(9)
  end

  it "checks that if the sell by date has passed, quality degrades twice as fast" do
    items = [Item.new("Elixir of the Mongoose", 0, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(8)
  end

  it 'quality is never more than 50' do
    items = [Item.new("Aged Brie", 5, 50)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to_not eq(51)
  end

# BRIE

  it "brie increases quality with age" do
    items = [Item.new("Aged Brie", 10, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(11)
  end


# BACKSTAGE PASSES

  it "backstage passes increase quality by 1 if concert more than 10 days in future" do
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(11)
  end

  it "backstage passes increase quality by 2 if concert in 10 days or less" do
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(12)
  end

  it "backstage passes increase quality by 3 if concert in 5 days or less" do
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(13)
  end

  it "backstage passes worth 0 if concert in the past" do
    items = [Item.new("Backstage passes to a TAFKAL80ETC concert", -1, 10)] 
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq(0)
  end


    # SULFURAS

  it 'Sulfuras never have to be sold or decrease quality' do
    items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)] 
    GildedRose.new(items).update_quality()
    expect(items[0].sell_in).to eq(10)
    expect(items[0].quality).to eq(80)
  end

  end
end