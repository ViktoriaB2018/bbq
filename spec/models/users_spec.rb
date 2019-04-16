require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_for_facebook_oauth' do
    let(:access_token) do
      double(
          :access_token,
          provider: 'facebook',
          info: double(email: 'vika@mail.com'),
          extra: double(raw_info: double(id: '10213477015136708'))
      )
    end

    context 'when user is not found' do
      it 'returns newly created user' do
        user = User.find_for_facebook_oauth(access_token)

        expect(user).to be_persisted
        expect(user.email).to eq 'vika@mail.com'
      end
    end

    context 'when user is found by email' do
      let!(:existing_user) { create(:user, email: 'vika@mail.com') }
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_facebook_oauth(access_token)).to eq existing_user
      end
    end

    context 'when user is found by provider + url' do
      let!(:existing_user) do
        create(:user, provider: 'facebook',
               url: 'https://facebook.com/10213477015136708')
      end
      let!(:some_other_uer) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_facebook_oauth(access_token)).to eq existing_user
      end
    end
  end

  describe '.find_for_vkontakte_oauth' do
    let(:access_token) do
      double(
          :access_token,
          provider: 'vkontakte',
          info: double(email: 'katya@mail.com'),
          extra: double(raw_info: double(id: '100'))
      )
    end

    context 'when user is not found' do
      it 'returns newly created user' do
        user = User.find_for_vkontakte_oauth(access_token)

        expect(user).to be_persisted
        expect(user.email).to eq 'katya@mail.com'
      end
    end

    context 'when user is found by email' do
      let!(:existing_user) { create(:user, email: 'katya@mail.com') }
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_vkontakte_oauth(access_token)).to eq existing_user
      end
    end

    context 'when user is found by provider + url' do
      let!(:existing_user) do
        create(:user, provider: 'vkontakte',
               url: 'https://vk.com/100')
      end
      let!(:some_other_uer) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_vkontakte_oauth(access_token)).to eq existing_user
      end
    end
  end
end
