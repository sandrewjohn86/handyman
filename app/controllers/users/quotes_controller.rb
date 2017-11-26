class Users::QuotesController < Users::ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def create
    @project = Project.find(params[:project_id])
    # @user = User.find(params[:user_id])
    @quote = @project.quotes.create(params[:quote].permit(:project_id, :user_id, :quote_details, :total, :start_date, :timeframe))
    @quote.user_id = current_user.id
    if @quote.save
      flash[:notice] = 'Quote Added'
      redirect_to users_project_quotes_path
    else
      render 'new'
    end
  end

  def index
    @quotes = current_user.quotes
    @project = Project.find(params[:project_id])
    # @project = Project.joins(:quote).where(:quotes => {:project_id => @quote.id})
     @projects = Project.all
  end

  def show
    @quote = Quote.find(params[:project_id])
  end

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
  end

  def destroy
    @quote = Quote.find(params[:id])

    @quote.destroy

    flash[:notice] = 'quote Removed'

    redirect_to projects_path
  end

  private
  def quote_params
    params.require(:quote).permit(:project_id, :user_id, :quote_details, :total, :start_date, :timeframe)
  end
end
