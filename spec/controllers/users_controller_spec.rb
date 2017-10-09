require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders a registration page' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'sends a mailer' do
      email_stub = double

      expect(email_stub).to receive(:deliver_later)
      expect(UserMailer).to receive(:login_link).and_return(email_stub)

      post :create, params: { user: { email: 'tom@domus.com' } }
    end
  end

  describe 'GET #show' do
    context 'with logged in user' do
      let(:user) { User.create(email: 'tom@domus.com') }

      before { login_as(user) }

      it 'renders the Account page' do
        get :show
        expect(response).to render_template(:show)
      end
    end

    context 'without logged in user' do
      it 'redirects to login page' do
        get :show
        expect(response).to redirect_to '/login'
        expect(flash[:alert]).to match(/^Please log in to view this page./)
      end
    end
  end
end
