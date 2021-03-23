class Training < ApplicationRecord

  has_many :category
  belongs_to :user

  with_options presence: true do
    validates :date
    validates :description
  end
end
