class Relationship < ApplicationRecord
  has_many :posts, dependent: :destroy
end
