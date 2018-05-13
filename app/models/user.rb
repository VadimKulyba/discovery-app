class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :expeditions
  has_many :forms, foreign_key: 'user_id', dependent: :destroy

  def following_expedition?(expedition)
    self.forms.find_by(expedition_id: expedition.id)
  end
end
