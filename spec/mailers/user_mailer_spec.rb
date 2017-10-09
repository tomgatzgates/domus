require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe '#login_link' do
    subject (:mail) { described_class.login_link(user) }

    let(:user) { User.new(email: 'tom@domus.com') }

    it 'creates a token for the user and sends the email' do
      expect { mail.deliver }
        .to change { user.token }.from(nil)
        .and change { user.token_expires_at }.from(nil)
    end

    it 'sends token in the email' do
      mail.deliver
      expect(mail.body.encoded).to include user.token
    end
  end
end
