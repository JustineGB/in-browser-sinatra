class Wine < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :vineyard, presence: true
  validates :rating, presence: true
  validates :year, presence: true 
  validates :user_id, presence: true
  validates :tasting_notes, presence: true

end
