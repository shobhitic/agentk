class SubscriptionPlansController < ApplicationController
  before_action :authenticate_user!
  
  def update
    @subscription_plan = SubscriptionPlan.find params[:id]
    if @subscription_plan.update subscription_plan_params
      redirect_to admin_path, notice: 'Subscription plan updated successfully.'
    else
      redirect_to admin_path, alert: 'There was a problem updating your subscription plan. Please try again.'
    end
  end

  def edit
    @subscription_plan = SubscriptionPlan.find params[:id]
  end

  private

  def subscription_plan_params
    params.require(:subscription_plan).permit(:name, :base_currency, :monthly_rate, :annual_rate)
  end
end
