class Article < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    
    after_validation :set_slug, only: [:create, :update]

    def self.sluggable
        all.extending(Sluggable::Finder)
    end

    def to_param
        return nil unless persisted?
        slug
    end
  
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
  
  private

    def set_slug
        self.slug = title.to_s.parameterize
    end
end
