class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :comment, presence: true,length:{maximum:140}
  
  def self.search_for(content)
    PostComment.where('comment LIKE ?', '%' + content + '%')
  end
end
