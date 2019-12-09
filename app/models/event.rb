class Event < ApplicationRecord
  belongs_to :user
  has_many :users, through: :attendees, source: :user
  has_many :attendees, dependent: :destroy
  validates :name, :date, :city, :state, presence: true
  

  before_validation :date_cannot_be_in_the_past, on: :create

  private
  def date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
