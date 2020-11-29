class NotificationJob < ApplicationJob
  queue_as :default

  def perform(model)
    all_emails = (model.event.subscriptions.map(&:user_email) + [model.event.user.email]).uniq
    all_emails.delete(model.user&.email)
    all_emails.each do |mail|
      case model
      when Comment
        EventMailer.comment(model.event, model, mail).deliver_later
      when Photo
        EventMailer.photo(model.event, model, mail).deliver_later
      end
    end
  end
end
