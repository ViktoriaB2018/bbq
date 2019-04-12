require 'rails_helper'
include ActiveJob::TestHelper

RSpec.describe SubscriptionMailerJob, type: :job do
  let(:user) { User.create(id: 1, email: 'vasya95@mail.ru', password: '123456') }
  let(:event) { user.events.create(id: 1, title: 'Let bbq!', address: 'Moscow, Gorky Park',
                                  datetime: '2019-05-11 19:06:00', user_id: 1) }
  let(:new_subscription) { event.subscriptions.create(user_name: "Kolyan", user_email: "kolyan96@mail.ru",
                                                      event_id: 1, user_id: nil) }

  it 'adds an email to queue' do
    ActiveJob::Base.queue_adapter = :test

    expect {
      SubscriptionMailerJob.perform_later(event, new_subscription)
    }.to have_enqueued_job.on_queue('default')
  end

  it 'sends an email' do
    expect {
      perform_enqueued_jobs do
        SubscriptionMailerJob.perform_later(event, new_subscription)
      end
    }.to change { ActionMailer::Base.deliveries.size }.by(1)
  end

  it 'sends an email to the right user' do
    perform_enqueued_jobs do
      SubscriptionMailerJob.perform_later(event, new_subscription)
    end

    mail = ActionMailer::Base.deliveries.last
    expect(mail.to[0]).to eq user.email
  end
end
