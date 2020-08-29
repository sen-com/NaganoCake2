class OrderDetail < ApplicationRecord
    belongs_to :order, optional: true
    belongs_to :item, optional: true

    enum production_status: {
        cannot_start: 1,
        awaiting_production: 2,
        in_production: 3,
        production_completed: 4
    }
end
