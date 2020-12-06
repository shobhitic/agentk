class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @app_configs = AppConfig.all
  end

  def edit
    @app_config = AppConfig.find params[:id]
  end

  def update
    @app_config = AppConfig.find params[:id]
    if @app_config.update app_config_params
      redirect_to admin_path, notice: 'Configuration updated successfully.'
    else
      render :edit, alert: 'Please try updating again.'
    end
  end

  private

  def app_config_params
    params.require(:app_config).permit(:value)
  end

end
