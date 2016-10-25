class BusyTime < ActiveRecord::Base
  validates :begin, presence: true
  validates :end, presence: true
  validates :service, presence: true, length: { minimum: 2, maximum: 200 }
end
