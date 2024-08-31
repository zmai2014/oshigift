class Situation < ApplicationRecord
  has_many :post_situations, dependent: :destroy
  has_many :posts, through: :post_situations
end
