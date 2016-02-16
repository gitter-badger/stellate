class User < ActiveRecord::Base
  rolify
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  has_one :profile, dependent: :destroy

  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'source_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'target_id',
                                   dependent: :destroy
  has_many :friends,   through: :active_relationships, source: :target
  has_many :followers, through: :passive_relationships, source: :source

  validates :screen_name, presence: true,
                          uniqueness: { case_sensitive: false }

  after_create do
    Profile.create(user_id: self.id)
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.screen_name || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(screen_name) = :value OR lower(email) = :value", {value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def create_relationship(target_user)
    active_relationships.create target: target_user
  end
  alias follow create_relationship

  def destroy_relationship(target_user)
    active_relationships.find_by(target: target_user).destroy
  end
  alias unfollow destroy_relationship

  def following?(target_user)
    friends.include? target_user
  end
end
