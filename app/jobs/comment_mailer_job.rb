class CommentMailerJob < ApplicationJob
  queue_as :default

  def perform(event, comment, mail)
    EventMailer.comment(event, comment, mail).deliver_now
  end
end
