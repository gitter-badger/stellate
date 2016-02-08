class User < ActiveRecord::Base
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy

  validates :screen_name, presence: true,
                          uniqueness: { case_sensitive: false }

  after_create do
    Profile.create(user_id: self.id)
  end
end