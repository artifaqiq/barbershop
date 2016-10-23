class Service < ActiveRecord::Base
  has_many :prices
  has_attachment  :photo,  accept: [:jpg, :png, :gif]
end
