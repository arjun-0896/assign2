class AgentsController < ApplicationController
  def index
    @agents=Agent.all
  end

  def new
    @agent= Agent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agent }
    end
  end

  def create
    @agent = Agent.new(agent_params)
    respond_to do |format|
      if @agent.save
        # log_in @agent
        flash[:success] = "Welcome to the Tour management system!"
        if session[:state] == 'admin'
          format.html { redirect_to :controller => 'welcome', :action => 'index', notice: 'Agent was successfully created.' }
        # format.json { render json: @agent, status: :created, location: @agent }
        else
          format.html { redirect_to '/options', notice: 'Agent was successfully created.' }
        # format.json { render json: @agent, status: :created, location: @agent }
        end
      else
        flash.now[:notice] = "Invalid parameters"
        format.html { render action: "new" }
        # format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @agent = Agent.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agent }
    end
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def update
    @agent = Agent.find(params[:id])

    respond_to do |format|
      if @agent.update_attributes(agent_params)
        format.html { redirect_to '/agentoptions', notice: 'Agent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agents.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @agent = Agent.find(params[:id])
    if @agent.destroy

      flash[:notice] = "Successfully deleted agent!"
      if session[:state] == 'admin'
        redirect_to '/options'
      else
        redirect_to :controller => 'sessions', :action => 'destroy'
      end
    else
      flash[:alert] = "Error deleting agent!"
    end
  end

  def agent_params
    params.require(:agent).permit(:name, :email, :password)
  end
end
