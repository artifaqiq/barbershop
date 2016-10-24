class Price < ActiveRecord::Base
  belongs_to :service

  validates :name, presence: true
  validates :value, presence: true
  validates :service_id, presence: true
end
