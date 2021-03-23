class Meal < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :date
    validates :image
  end
end
