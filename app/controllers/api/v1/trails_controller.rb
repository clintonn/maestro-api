class Api::V1::TrailsController < Api::V1::ApplicationController

  before_action :authenticate_user, only: :create

  def create

  end

end
