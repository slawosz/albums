require 'spec_helper'

describe Album do

  let(:user) do
    data = { name: 'Foo', email: 'foo@example.org',
      password: 'secret', password_confirmation: 'secret' }
    User.create(data)
  end
  
  let(:new_album) do
    a = Album.new(name: 'Foo', description: 'Lorem ipsum...')
    a.user_id = user.id
    a
  end
  
  let(:album) do
    new_album.save
    new_album
  end

  it 'should be valid' do
    new_album.save.should be_true
  end

  it 'should not be valid without name' do
    new_album.name = ''
    new_album.should_not be_valid
  end

  it 'should not be valid without user_id' do
    new_album.user_id = nil
    new_album.should_not be_valid
  end
  
  it 'should belongs to user' do
    album.user.should == user
  end

  it 'should be not unsecure' do
    expect do
      Album.new(user_id: 666)
    end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  end
  
end
