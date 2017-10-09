require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'POST #create' do
    context 'with registered user' do
      let(:email) { 'tom@domus.com' }

      before { User.create(email: email) }

      it 'sends a mailer' do
        email_stub = double

        expect(email_stub).to receive(:deliver_later)
        expect(UserMailer).to receive(:login_link).and_return(email_stub)

        post :create, params: { email: email }
      end

      it 'redirects to login with flash message' do
        post :create, params: { email: email }

        expect(response).to redirect_to '/login'
        expect(flash[:notice]).to match(/^We have sent you the link to login to our app/)
      end
    end

    context 'with new user' do
      it 'redirects to login with flash message' do
        post :create, params: { email: 'tom@domus.com' }

        expect(response).to redirect_to '/login'
        expect(flash[:notice]).to match(/^Sorry, we do not recognise that email address./)
      end
    end
  end

  describe 'GET #auth' do
    context 'with valid token' do
      let(:user) { User.new(email: 'tom@domus.com') }
      let(:token) { user.generate_token }

      it 'redirects to home with flash message' do
        get :auth, params: { token: token }

        expect(response).to redirect_to '/'
        expect(flash[:notice]).to match(/^Successfully logged in./)
      end
    end

    context 'with invalid token' do
      let(:user) { User.new(email: 'tom@domus.com') }

      it 'redirects to login with flash message' do
        get :auth, params: { token: 'this-is-a-token' }

        expect(response).to redirect_to '/login'
        expect(flash[:notice]).to match(/^Sorry, that token is invalid./)
      end
    end
  end
end
