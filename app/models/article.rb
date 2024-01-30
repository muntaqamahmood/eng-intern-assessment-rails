class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
  
    scope :search_by_query, ->(query) {
      where("title LIKE :query OR content LIKE :query", query: "%#{query}%") if query.present?
    }
  
    def self.search(query, page = 1, per_page = 5)
      page = [page.to_i, 1].max
      offset = (page - 1) * per_page
      search_by_query(query).limit(per_page).offset(offset)
    end
  end
  