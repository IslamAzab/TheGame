class ProfileController < ApplicationController
  # skip_before_filter :authorize
  
  # GET /profile
  def profile
    @user = current_user

    respond_to do |format|
      format.html # profile.html.haml
    end
  end

  # GET /profile/edit
  def edit
    @user = current_user

    respond_to do |format|
      format.html # profile.html.haml
    end
  end

  # GET /profile/:id
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html # profile.html.haml
    end
  end
end
