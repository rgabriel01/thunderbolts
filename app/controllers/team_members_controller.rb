class TeamMembersController < ApplicationController
  before_action only: :index do
    doorkeeper_authorize! :admin
  end

  def index
    team_member = TeamMember.all
    render json: team_member, status: :ok
  end
end
