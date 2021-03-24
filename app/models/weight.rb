class Weight < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :weight, numericality: { with: /\A([0-9]{0,3}|0)(\.[0-9]{1,3})?\z/, greater_than_or_equal_to: 0 }
    validates :date
  end

end
