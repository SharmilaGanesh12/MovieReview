class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Association
  has_many :reviews,dependent: :destroy

  # Validation
  validate :email_format
  validate :strong_password

  private

  def email_format
    unless email.match?(/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/)
      errors.add(:email, 'address is not valid')
    end
  end

  def strong_password
    unless password.match?(/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{6,}$/)
      errors.add(:password, 'must include at least one uppercase letter, one lowercase letter, and one digit')
    end
  end
end
