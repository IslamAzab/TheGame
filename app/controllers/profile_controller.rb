class ProfileController < ApplicationController
  # skip_before_filter :authorize
  
  # GET /profile
  def profile
    @user = current_user
  end

  # GET /profile/edit
  def edit
    @user = current_user
  end

  # PUT /profile/edit
  def update
    @user = current_user
    
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
