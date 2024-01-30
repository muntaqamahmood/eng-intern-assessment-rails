class Article < ApplicationRecord
    # create new article requires title and content only
    validates :title, presence: true
    validates :content, presence: true

    
end
