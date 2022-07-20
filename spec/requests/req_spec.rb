require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'creates the page user/id and redirects to the users page' do
    get '/users/new'
    expect(response).to render_template(:new)

    post '/users', params: { user: { login: 'dhh' } }

    expect(response).to redirect_to(assigns(:user))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include('Repositories')
  end
end
