class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :profile_image, destroy: false
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :name, presence: true, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 50}
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy  # フォロー取得
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following, through: :active_relationships, source: :followed # 自分がフォローしている人
  has_many :followers, through: :passive_relationships, source: :follower # 自分をフォローしている人
  
  # ユーザーをフォローする
  def follow
    active_relationships.create(followed_id: other_user.id)
  end
  
   # ユーザーのフォローを外す
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  # フォローしていればtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  
end