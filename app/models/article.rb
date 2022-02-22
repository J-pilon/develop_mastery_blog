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
    
    private

    def set_slug
        self.slug = title.to_s.parameterize
    end
end
