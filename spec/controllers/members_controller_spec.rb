require 'spec_helper'

describe MembersController do

  let :valid_params do
    {
      member: {
        username: 'bulkneets',
        password: 'mala',
        password_confirmation: 'mala',
      }
    }
  end

  let :valid_sessions do
    { }
  end

  describe 'GET /new' do
    it 'renders the new template' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template('new')
    end
  end

  describe 'POST /create'do
    it 'creates new member' do
      expect {
        post :create, params: valid_params, session: valid_sessions
      }.to change {
        Member.count
      }.by(1)
    end

    it 'redirects to /' do
      post :create, params: valid_params, session: valid_sessions
      expect(response).to redirect_to('/')
    end
  end
end
