class Teleshow < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :chanel, presence: true, length: { minimum: 3 }
  has_attached_file :image, styles: { medium: '500x500>', thumb: '100x100>' },
                            default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_and_belongs_to_many :expeditions
end
