class Sale < ActiveRecord::Base
  has_attachment  :photo,  accept: [:jpg, :png, :gif]
end
