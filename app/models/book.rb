class Book < ActiveRecord::Base
  attr_accessible :description, :state, :title, :user_id, :image
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  
end
