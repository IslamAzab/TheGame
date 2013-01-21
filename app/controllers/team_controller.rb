class TeamController < ApplicationController
  # TODO before_filter :require_coach

  # GET /team
  def index
    @user = current_user     
  end
end
