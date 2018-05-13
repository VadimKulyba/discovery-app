class Form < ApplicationRecord
  belongs_to :user
  belongs_to :expedition
  validates :user_id, presence: true
  validates :expedition_id, presence: true
end
