class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates :body,  presence: true
  validates :user,  presence: true
  validates :topic, presence: true
end
