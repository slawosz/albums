class Album < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
