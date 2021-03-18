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
end
