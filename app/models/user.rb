class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships, foreign_key: :follower_id
  has_many :followings, through: :relationships

  has_many :inverse_follows, foreign_key: :following_id, class_name: Relationship
  has_many :followers, through: :inverse_follows


  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z][a-z0-9]+\z/ }, length: { in: 4..24 }
  validates :screen_name, length: { maximum: 140 }
  validates :bio, length: { maximum: 200 }

  def followed_by? user
  	inverse_follows.where(follower_id: user.id).exists?
  end

end
