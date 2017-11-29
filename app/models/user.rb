class User < ApplicationRecord
  has_many :participations
  has_many :articles
  has_many :events, through: :participations
  has_many :comments, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.send_welcome_mail(self).deliver
  end
end
