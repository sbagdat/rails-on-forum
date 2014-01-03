class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum

  validates :title, presence: true
  validates :body,  presence: true, length: {minimum: 20}
  validates :user,  presence: true
  validates :forum, presence: true
end
