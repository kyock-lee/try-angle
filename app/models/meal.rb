class Meal < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  def self.search(search)
    if search != ""
      Meal.where('date LIKE(?)', "%#{search}%")
    else
      Meal.all
    end
  end

end
