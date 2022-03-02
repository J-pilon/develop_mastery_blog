class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true

    def self.last_page(limit: 10)

        if limit != 0 
            (self.count / limit.to_f).ceil
        else
            1
        end
    end

    def self.order_data(order: :desc)
        self.all.order(created_at: order)
    end

    def self.offset_data(limit: 10, page: 1)
        if limit == 0
            limit = Article.count
        end
        
        order_data.limit(limit).offset(limit * (page - 1))
    end
end
