class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :relationship
  has_many :post_situations, dependent: :destroy
  has_many :situations, through: :post_situations
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  enum age: { ageless: 0, age10s: 1, age20s: 2, age30s: 3, age40s: 4, age50s: 5, over60s: 6 }
  enum gender: { genderless: 0, male: 1, female: 2 }
  enum price: { lessthan3000: 0, lessthan5000: 1, lessthan10000: 2, lessthan30000: 3, morethan30000: 4 }
  
  def like_by?(user)
    likes.exists?(user_id: user.id)
  end
  
  # def self.search_for(content, method)
  #   if method == 'perfect'
  #     Post.where(item_name: content)
  #   elsif method == 'forward'
  #     Post.where('item_name LIKE ?', content + '%')
  #   elsif method == 'backward'
  #     Post.where('item_name LIKE ?', '%' + content)
  #   else
  #     Post.where('item_name LIKE ?', '%' + content + '%')
  #   end
  # end
  
  def self.search_for(content)
    Post.where('item_name LIKE ?', '%' + content + '%')
  end
  
end
