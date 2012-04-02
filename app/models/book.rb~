class Book < ActiveRecord::Base
  attr_accessible :description, :state, :title, :user_id
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  
end
