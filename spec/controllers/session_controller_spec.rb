require 'spec_helper'

describe SessionController do

  let!(:user) do
    data = { name: 'Foo', email: 'foo@example.org',
      password: 'secret', password_confirmation: 'secret' }
    User.create(data)
  end

  it 'should login successfully' do
    post :create, email: 'foo@example.org', password: 'secret'

    session[:user_id].should == user.id
    response.should redirect_to(:albums)
  end

  it 'should not login successfully' do
    post :create, email: 'foo@example.org', password: 'secrettt'

    session[:user_id].should == nil
    response.should redirect_to(:new_session)
  end

end
