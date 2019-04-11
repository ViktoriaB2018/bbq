require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user_owner) { User.new }
  let(:user_not_owner) { User.new }
  let(:event) { user_owner.events.build }
  subject { EventPolicy }

  permissions :edit?, :update?, :destroy? do
    it "denies access if user is anonim" do
      expect(subject).not_to permit(false, event)
    end

    it "denies access if user is authorized but he's not owner" do
      expect(subject).not_to permit(user_not_owner, event)
    end

    it "grants access if user is authorized and he is owner" do
      expect(subject).to permit(user_owner, event)
    end
  end

  permissions :show? do
    it "grants access if user is anonim" do
      expect(subject).to permit(true, event)
    end

    it "grants access if user is authorized but he's not owner" do
      expect(subject).to permit(user_not_owner, event)
    end

    it "grants access if user is authorized and he is owner" do
      expect(subject).to permit(user_owner, event)
    end
  end
end
