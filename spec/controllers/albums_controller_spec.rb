require 'spec_helper'

describe AlbumsController do

  let!(:user) do
    data = { name: 'Foo', email: 'foo@example.org',
      password: 'secret', password_confirmation: 'secret' }
    User.create(data)
  end
  
  describe '/index' do
    it 'should redirect when user is not set' do
      session[:user_id] = nil
      get :index
      
      response.should redirect_to(:new_session)
    end

    it 'should get users album' do
      user_id = double
      session[:user_id] = user_id
      current_user = double
      User.should_receive(:find).with(user_id).and_return(current_user)
      current_user.should_receive :albums
      get :index
    end
    
  end
  
end
