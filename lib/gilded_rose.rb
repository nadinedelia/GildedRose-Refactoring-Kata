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
        if item.sell_in <= DUE_DATE
          item.quality == 0
        elsif item.sell_in > 10 
          item.quality += 1
        elsif item.sell_in <= 10
          item.quality += 2 
        elsif item.sell_in <= 5  
          item.quality += 3
        else item.quality == MAX_QUALITY
        end
      end

  # --------------  SULFURAS -------------- 
      if item.name == "Sulfuras, Hand of Ragnaros"
        item.quality == 80

        







      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality -= 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality += 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality += 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in -= 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality -= 1
              end
            end
          else
            item.quality -= item.quality
          end
        else
          if item.quality < 50
            item.quality += 1
          end
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

end