class User < ActiveRecord::Base
  rolify
  acts_as_paranoid

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]

  has_one :profile, dependent: :destroy

  has_many :active_relationships,  -> { where relationships: { type: "follow" } },
                                   class_name: 'Relationship',
                                   foreign_key: 'source_id',
                                   dependent: :destroy
  has_many :passive_relationships, -> { where relationships: { type: "follow" } },
                                   class_name: 'Relationship',
                                   foreign_key: 'target_id',
                                   dependent: :destroy
  has_many :blocked_relationships, -> { where relationships: { type: "block" } },
                                   class_name: 'Relationship',
                                   foreign_key: 'source_id',
                                   dependent: :destroy
  has_many :friends,    through: :active_relationships, 
                        source: :target
  has_many :followers,  through: :passive_relationships, 
                        source: :source
  has_many :blocks,     through: :blocked_relationships, 
                        source: :target

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

  # creates a follow relation between two users
  # @param target_user [Object] User object to follow
  def create_relationship(target_user)
    return if target_user.blocked? self
    active_relationships.create(target: target_user)
  end
  alias follow create_relationship

  # destroys a follow relation between two users
  # @param target_user [Object] User object to unfollow
  def destroy_relationship(target_user)
    active_relationships.find_by(target: target_user).destroy
  end
  alias unfollow destroy_relationship

  # checks if a user is following the target
  # @param target_user [Object] User object to check
  # @return [Boolean] status of following
  def following?(target_user)
    friends.include? target_user
  end

  # creates a block relation between two users
  # if follow relations exists, these are destroyed
  # @param target_user [Object] User object to block
  def block_relationship(target_user)
    if self.following? target_user
      self.unfollow target_user
    end

    if target_user.following? self
      target_user.unfollow self
    end

    blocked_relationships.create(target: target_user)
  end
  alias block block_relationship

  # destroys a block relation between two users
  # @param target_user [Object] User object to unblock
  def unblock_relationship(target_user)
    blocked_relationships.find_by(target: target_user).destroy
  end
  alias unblock unblock_relationship

  # checks if a user has blocked the target
  # @param target_user [Object] User object to check
  # @return [Boolean] status of blocking
  def blocked?(target_user)
    blocks.include? target_user
  end

  # checks if a relationship between two users is mutual
  # @param target_user [Object] User object to check
  # @return [Boolean] mutual status
  def mutual?(target_user)
    return target_user.following?(self) && self.following?(target_user)
  end
end
