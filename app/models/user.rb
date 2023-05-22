class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notifications

  after_create :discord_webhook

  private
  def discord_webhook
    emoji = ["🥳","🎉","🙌","🎊"].sample
    Discord.post_message("#{emoji} new signup! #{email}")
  end
end
