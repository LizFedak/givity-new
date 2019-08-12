class Post < ApplicationRecord
    has_rich_text :body
    validates :title, presence: true
    belongs_to :user

    def user_mentions
        @users ||= body.body.attachments.select{ |a| a.attachable.class == User }.map(&:attachable).uniq
      end

      
end
