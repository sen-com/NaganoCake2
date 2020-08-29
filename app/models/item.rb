class Item < ApplicationRecord

    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre, optional: true
    attachment :image

    def self.search(search)   
        if search  
          where(['name LIKE ?', "%#{search}%"])   
        else
          where(is_working: "true")
        end  
    end  

end
