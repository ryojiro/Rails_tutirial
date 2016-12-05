class Forum < ActiveRecord::Base
  has_many :forum_comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) } 
end
