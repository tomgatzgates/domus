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

      post :create, params: { user: { email: 'tom@gates.com' } }
    end
  end
end
