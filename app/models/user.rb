class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :workspaces, foreign_key: :owner_id, dependent: :destroy
  has_many :checklists, through: :workspaces

  def full_name
    "#{first_name} #{last_name}"
  end
end
