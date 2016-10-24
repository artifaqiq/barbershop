class Sale < ActiveRecord::Base
  has_attachment  :photo,  accept: [:jpg, :png, :gif]

  validates :percent, exclusion: { in: [0..100] }
  validates :service_id, presence: true
end
