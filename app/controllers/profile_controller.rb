class ProfileController < ApplicationController
    
  # GET /profile
  def profile
    @user = current_user
  end

  # GET /profile/edit
  def edit
    @user = current_user
  end

  # PUT /profile
  def update
    @user = current_user

    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to profile_path }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # GET /profile/:id
  def show
    @user = User.find(params[:id])
  end

end
