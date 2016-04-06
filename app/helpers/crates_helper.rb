module CratesHelper
    
   def find_status(status_id)
        State.find_by_id(status_id).status
    end

    def tag_links(tags)
        tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.uniq.join(", ") 
    end
    
    def find_state_color(status_id)
        State.find_by_id(status_id).color
    end
    
    def crate_quality(quality_id)
        Quality.find_by_id(quality_id).name
    end
    
    def locate(locate_id)
        Location.find_by_id(locate_id).name
    end 
    
    def delmited_price(price)
        number_with_delimiter(price, delimiter: ',', separator: '.')
    end
    
    def catgory(c)
        Category.find(c).name
    end
    
    def simplify(object, lengt)
        simple_format(truncate(object, length: lengt))
    end
    
    def show_thumb(pic)
        pic.image.url(:thumb)
    end
    
        
    
end
