class Expedition < ApplicationRecord
  belongs_to :user
  has_many :forms, foreign_key: 'expedition_id', dependent: :destroy
end
