class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]
         
  validates :name ,uniqueness: true
         
  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  # def self.search_for(content, method)
  #   if method == 'perfect'
  #     User.where(name: content)
  #   elsif method == 'forward'
  #     User.where('name LIKE ?', content + '%')
  #   elsif method == 'backward'
  #     User.where('name LIKE ?', '%' + content)
  #   else
  #     User.where('name LIKE ?', '%' + content + '%')
  #   end
  # end
  
  def self.search_for(content)
    User.where('name LIKE ?', '%' + content + '%')
  end
  
end
