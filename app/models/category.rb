class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses, dependent: :destroy

  validates :name, :state, presence: :true
  validates_uniqueness_of :name
end
