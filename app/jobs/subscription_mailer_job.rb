class SubscriptionMailerJob < ApplicationJob
  queue_as :default

  def perform(event, new_subscription)
    EventMailer.subscription(event, new_subscription).deliver_now
  end
end
