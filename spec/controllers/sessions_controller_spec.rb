require 'spec_helper'

describe SessionsController do

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST create' do
    let!(:user) { create(:user) }

    context 'with valid credentials' do

      before(:each) do
        post :create, { session: {email: user.email, password: user.password} }
      end

      it 'assigns the user\'s id to the session' do
        session[:user_id] = user.id 
        expect(session[:user_id]).to eq(user.id)
      end

      it 'redirects to the root_path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentiatls' do
      before(:each) do
        post :create, { session: {email: user.email, password: 'not the password'} }
      end

      it 'does not assign a user_id to the session' do
        expect(session[:user_id]).to be_nil
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:user) { create(:user) }

    before do
      session[:user_id] = user.id
    end

    it 'destroys the current session' do
      post :create, { session: {email: user.email, password: user.password} }
      delete :destroy

      expect(cookies[:remember_token]).to be_nil
    end
  end

end
