class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:email]
  
  def self.search_for(content)
    if Post.where('introduction LIKE ?', '%' + content + '%')
    else
      User.where('introduction LIKE ?', '%' + content + '%')
    end
  end
  
end
