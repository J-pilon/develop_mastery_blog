class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    def self.last_page(limit: 10)
        self.count / limit
    end

    def self.order_data(order: :desc)
        self.all.order(created_at: order)
    end

    def self.offset_data(limit: 10, page: 1)
        order_data.limit(limit).offset(limit * (page - 1))
    end
end
