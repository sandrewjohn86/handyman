class SubscribersController < ApplicationController
  def index
  	@subscriber = Subscriber.new
  end

  def create
  	if @subscriber.save
  		cookies[:save_lead] = true
  		redirect_to root_path, notice: "Saved Successfully!"
  	else
  		redirect_to root_path, notice: " Failed to save"
  	end
  end

  private
  def subscriber_params
  	params.require(:subscriber).permit(:name, :email)
  end
end
