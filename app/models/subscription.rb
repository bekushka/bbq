class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  scope :persisted, -> { where('id IS NOT NULL') }

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validate :email_duplicate, unless: -> { user.present? }
  validate :no_self_subscription, if: -> { user.present? }


  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def no_self_subscription
    errors.add(:base, :no_self_subscription) if event.user == user
  end

  def email_duplicate
    errors.add(:user_email, I18n.t('errors.messages.taken')) if User.exists?(email: user_email)
  end
end
