class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  validates :body,  presence: true, length: {minimum: 20}
  validates :user,  presence: true
  validates :topic, presence: true
end
