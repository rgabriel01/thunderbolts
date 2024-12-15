class TeamMembersController < ApplicationController
  def index
    team_member = TeamMember.all
    render json: team_member, status: :ok
  end
end
