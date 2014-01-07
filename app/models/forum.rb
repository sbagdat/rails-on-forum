class Forum < ActiveRecord::Base
  has_many :topics, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
