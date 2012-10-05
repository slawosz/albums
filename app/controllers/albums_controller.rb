class AlbumsController < ApplicationController
  before_filter :require_user
  
  def index
    @albums = current_user.albums
  end
end
