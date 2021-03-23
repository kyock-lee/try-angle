class Weight < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :weight, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :date
  end

end
