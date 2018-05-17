class Position < ApplicationRecord
  has_and_belongs_to_many :expeditions
end
