class Course < ApplicationRecord
  belongs_to :category

  validates :name, :author, :state, presence: :true
end
