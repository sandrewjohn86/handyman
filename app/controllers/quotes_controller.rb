class QuotesController < ApplicationController
  def new
  end

  def create
    @project = Project.find(params[:project_id])
    # @user = User.find(params[:user_id])
    @quote = @project.quotes.create(params[:quote].permit(:project_id, :user_id, :quote_details, :total, :start_date, :timeframe))
    @quote.user_id = current_user.id
    if @quote.save
      flash[:notice] = 'Quote Added'
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  # private
  # def quote_params
  #   params.require(:quote).permit(:project_id, :user_id, :quote_details, :total, :start_date, :timeframe)
  # end
end
