class Profile < ActiveRecord::Base
  belongs_to :user

  validates :display_name, length: { maximum: 32 }
  validates :location, length: { maximum: 32 }
  validates :bio, length: { maximum: 256 }
end
