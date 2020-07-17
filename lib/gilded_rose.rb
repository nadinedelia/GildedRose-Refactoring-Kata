require_relative 'item'

class GildedRose

  DUE_DATE = 0
  MIN_QUALITY = 0
  MAX_QUALITY = 50
  BEST_QUALITY = 80

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|

  # --------------  BASIC ITEMS -------------- 

      if basic_item(item)
        item.sell_in <= DUE_DATE ? item.quality -= 2 : item.quality -= 1 unless item.quality == MIN_QUALITY
      end

  # --------------  AGED BRIE -------------- 
      if item.name == "Aged Brie"
        item.sell_in <= DUE_DATE ? item.quality += 2 : item.quality += 1 unless item.quality == MAX_QUALITY
      end

  # --------------  BACKSTAGE PASSES -------------- 
  if item.name == "Backstage passes to a TAFKAL80ETC concert"
    item.sell_in <= 5 ? item.quality += 3 : item.quality += 2 unless item.quality == MAX_QUALITY
   if item.sell_in <= DUE_DATE
      item.quality = MIN_QUALITY
   end
 end

 # --------------  SULFURAS -------------- 
 if item.name == "Sulfuras, Hand of Ragnaros"
    item.quality = BEST_QUALITY
 end


end
end
end


  def basic_item(item)
    item.name != "Aged Brie" && 
    item.name != "Backstage passes to a TAFKAL80ETC concert" &&
    item.name != "Sulfuras, Hand of Ragnaros" &&
    item.name != "Conjured"
  end