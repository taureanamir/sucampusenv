class Event < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  has_many :comments, dependent: :destroy

  validates :title, :presence => true
  validates :description, :presence => true

  def start_time
    event_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
