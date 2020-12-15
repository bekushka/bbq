class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook vkontakte]

  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true,
            uniqueness: true,
            length: { maximum: 35 }

  validates :email, presence: true

  before_validation :set_name, on: :create
  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  private

  def self.find_for_oauth(access_token)
    name = access_token.info.name
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    provider = access_token.provider
    id = access_token.extra.raw_info.id

    case provider
    when 'facebook'
      url = "https://facebook.com/#{id}"
      avatar = access_token.info.image.gsub('http', 'https')
    when 'vkontakte'
      url = "https://vk.com/#{id}"
      avatar = access_token.extra.raw_info.photo_200
    end


    where(url: url, provider: provider).first_or_create! do |user|
      user.name = name
      user.email = email
      user.remote_avatar_url = avatar
      user.password = Devise.friendly_token.first(16)
    end
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end

  def set_name
    self.name = "Уважаемый человек №#{rand(777)}" if self.name.blank?
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
