class PhotoMailerJob < ApplicationJob
  queue_as :default

  def perform(event, photo, mail)
    EventMailer.photo(event, photo, mail).deliver_now
  end
end
