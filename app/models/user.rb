class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :expeditions
  has_many :forms, foreign_key: 'user_id', dependent: :destroy

  def following_expedition?(expedition)
    forms.find_by(expedition_id: expedition.id)
  end

  def follow!(exp, pos)
    return false if !count?(exp) || !check_data?(exp)
    if pos.present?
      positions = exp.positions.map(&:name)
      if positions.include?(pos) && !exp.forms.where(position: pos).present?
        forms.create!(expedition_id: exp.id, position: pos)
      else
        return false
      end
    else
      forms.create!(expedition_id: exp.id, position: 'волонтер')
    end
  end

  def unfollow!(expedition)
    forms.find_by(expedition_id: expedition.id).destroy!
  end

  private

  def check_data?(exp)
    exp.start >= Time.zone.now
  end

  def count?(expedition)
    true if expedition.forms.count <= 50
  end
end
