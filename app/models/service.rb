class Service < ActiveRecord::Base
  has_many :prices
  has_attachment  :photo,  accept: [:jpg, :png, :gif]

  validates :title, presence: true
  validates_associated :prices
end
