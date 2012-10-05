require 'spec_helper'

describe User do

  let(:valid_user_data) do
    { name: 'Foo', email: 'foo@example.org',
      password: 'secret', password_confirmation: 'secret' }
  end
  
  context 'should be valid' do
    specify { User.new(valid_user_data).should be_valid }
  end

  shared_examples_for 'invalid user' do
    specify { User.new(user_data).should_not be_valid }
  end
  
  context 'blank name' do
    let(:user_data) { valid_user_data.merge(name: '') }
    
    it_should_behave_like 'invalid user' 
  end

  context 'blank email' do
    let(:user_data) { valid_user_data.merge(email: '') }
    
    it_should_behave_like 'invalid user' 
  end

  context 'blank password' do
    let(:user_data) { valid_user_data.merge(password: '') }
    
    it_should_behave_like 'invalid user' 
  end

  context 'blank password_confirmation' do
    let(:user_data) { valid_user_data.merge(password_confirmation: '') }
    
    it_should_behave_like 'invalid user' 
  end

  context 'password_confirmation is other than password' do
    let(:user_data) { valid_user_data.merge(password_confirmation: 'SECRET') }
    
    it_should_behave_like 'invalid user' 
  end

  context 'name already taken' do
    before { User.create(valid_user_data.merge(email: 'bar@example.org')) }
    
    let(:user_data) { valid_user_data }
    
    it_should_behave_like 'invalid user' 
  end

  context 'email already taken' do
    before { User.create(valid_user_data.merge(name: 'Bar')) }
    
    let(:user_data) { valid_user_data }
    
    it_should_behave_like 'invalid user' 
  end

  context 'authentication' do
    let(:user) { User.create(valid_user_data) }


    it 'should authenticate' do
      user.authenticate('secret').should be_true
    end

    it 'should not authenticate' do
      user.authenticate('Secret').should be_false
    end
    
  end
  
end
