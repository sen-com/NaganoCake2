class Order < ApplicationRecord
    belongs_to :end_user, optional: true
    has_many :order_details, dependent: :destroy

    enum method_payment: {
        credit_card: 0,
        bank_transfer: 1
    }
    enum order_status: {
        waiting_for_payment: 1,
        confirmed_payment: 2,
        in_production: 3,
        preparing_for_shipping: 4,
        already_shipped: 5
    }

    def view_postnumber_address_name
        self.postal_nummber.to_s + "　" + self.address + " " + self.name 
    end
end
