class QuotesController < ApplicationController
  before_filter :authenticate_user!
  
  def edit
    @quote = Quote.find(params[:id])
  end

  def update

    @quote = Quote.find(params[:id])

    if @quote.update(quote_params)
      flash[:notice] = 'Quote Updated'
      redirect_to users_project_quotes_path 
    else
      render 'edit'
    end

    # @project = Project.find(params[:project_id])
    # # @user = User.find(params[:user_id])
    # @quote = @project.quotes.create(quote_params)
    # @quote.user_id = current_user.id
    # if @quote.save
    #   flash[:notice] = 'Quote Added'
    #   redirect_to users_project_quotes_path
    # else
    #   render 'new'
    # end
  end

  private
  def quote_params
    params.require(:quote).permit(:project_id, :user_id, :quote_details, :total, :start_date, :timeframe)
  end
end
