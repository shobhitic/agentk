class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @app_configs = AppConfig.all
  end
end
