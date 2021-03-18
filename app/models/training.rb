class Training < ApplicationRecord

  has_many :category
  belongs_to :user

  with_options presence: true do
    validates :date
    validates :description
  end

  def self.search(search)
    if search != ""
      Training.where('date LIKE(?)', "%#{search}%")
    else
      Training.all
    end
  end


end
