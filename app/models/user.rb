class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles
  validates :name, presence: true
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

end
