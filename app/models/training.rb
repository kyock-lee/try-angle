class Training < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :date
    validates :description
  end
end
