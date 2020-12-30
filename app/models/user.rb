class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,            presence: true
  validates :birthday,            presence: true
  validates :password_confirmation, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name_k, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_k, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/}
end
