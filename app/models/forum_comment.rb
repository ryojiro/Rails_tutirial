class ForumComment < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  
  validates :user_id, presence: true
  validates :forum_id, presence: true
  validates :body, presence: true, length: { maximum: 255 }
end
