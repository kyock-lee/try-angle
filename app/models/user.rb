class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meals
  has_many :weights
  has_many :trainings
  
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :family_name_kana
    validates :last_name
    validates :last_name_kana
    validates :birthday
  end

  def self.guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.nickname = 'ゲスト'
    user.family_name ='太朗'
    user.family_name_kana ='タロウ'
    user.last_name ='閲覧'
    user.last_name_kana ='エツラン'
    user.birthday = '2000-1-1'
    end
  end


  
end
