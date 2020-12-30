class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,            presence: true
  validates :birthday,            presence: true
  validates :password_confirmation, presence: true
  validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    :last_name
    :first_name
    :last_name_k
    :first_name_k
  end

  
end
