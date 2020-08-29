class Address < ApplicationRecord

    belongs_to :end_user

    def view_postnumber_address_name
        self.postal_number.to_s + self.address + self.name 
    end
    
end
