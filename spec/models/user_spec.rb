require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email=' do
    it 'downcases emails' do
      user = User.new(email: 'TOM@TOM.COM')
      expect(user.email).to eq 'tom@tom.com'
    end

    it 'removes whitespace' do
      user = User.new(email: '      tom@tom.com     ')
      expect(user.email).to eq 'tom@tom.com'
    end
  end

  describe '#generate_token' do
    let(:user) { User.new(email: 'tom@gates.com') }

    it 'sets the generated time' do
      expect { user.generate_token }
        .to change { user.token_expires_at }.from(nil)
        .and change { user.token }.from(nil)
    end
  end

  describe '#expire_token!' do
    let(:user) { User.new(email: 'tom@gates.com', token: 'foo', token_expires_at: Time.now) }

    it 'resets the token and token_expires_at to nil' do
      expect { user.expire_token! }
        .to change { user.token }.to(nil)
        .and change { user.token_expires_at }.to(nil)
    end
  end
end
