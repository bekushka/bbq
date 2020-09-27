class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true,
                   length: { maximum: 35 }
  validates :email, presence: true
  validate :no_self_subscription, on: :create, if: -> { user.present? }

  before_validation :set_name, on: :create
  after_commit :link_subscriptions, on: :create

  private

  def no_self_subscription
    errors.add(:base, I18n.t('no_self_subscription')) if current_user == @event.user
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
        .update_all(user_id: self.id)
  end

  def set_name
    self.name = "Уважаемый человек №#{rand(777)}" if self.name.blank?
  end
end
