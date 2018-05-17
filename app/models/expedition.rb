class Expedition < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :target, presence: true, length: { minimum: 3 }
  validates :start, presence: true
  validates :finish, presence: true
  validates_date :finish, :after => :start,
                          :before_message => 'finish after start'

  has_attached_file :cover, styles: { medium: '500x500>', thumb: '100x100>' },
                            default_url: '/images/:style/missing.png'
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  belongs_to :user
  has_many :forms, foreign_key: 'expedition_id', dependent: :destroy

  has_and_belongs_to_many :teleshows, dependent: :destroy
  has_and_belongs_to_many :regions, dependent: :destroy
  has_and_belongs_to_many :positions, dependent: :destroy
end
