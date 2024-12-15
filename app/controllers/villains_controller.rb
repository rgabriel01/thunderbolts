class VillainsController < ApplicationController
  before_action only: :index do
    doorkeeper_authorize! :read, :admin
  end

  def index
    villains = Villain.all
    render json: villains, status: :ok
  end
end
