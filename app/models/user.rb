class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :notifications

  def notifications_this_month_count
    notifications.where('created_at > ?', Time.now.beginning_of_month).count
  end
end
