class Post < ApplicationRecord
    has_rich_text :body
    validates :title, presence: true
    belongs_to :user
end
