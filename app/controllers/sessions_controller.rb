class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create

    if  params[:session][:state].downcase != "admin" && params[:session][:state].downcase != "agent" && params[:session][:state].downcase != "customer"
      flash.now[:notice] = "Invalid state"
      render 'new'
    end

    ency_pass = BCrypt::Password.create("team")

    if params[:session][:state].downcase == "admin"
      if params[:session][:email].downcase == "admin@ncsu.edu" && BCrypt::Password.new(ency_pass) == params[:session][:password]
        session[:member_id] = 1
        session[:email]="admin@ncsu.edu"
        session[:state] = params[:session][:state].downcase
        redirect_to :controller => 'options', :action => 'index'

      else
        flash.now[:notice] = "Invalid email/password combination"
        render 'new'
      end
    end

    if params[:session][:state].downcase == "agent"
       user = Agent.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
         session[:member_id] = user.id
         session[:email]= user.email
         session[:state] = params[:session][:state].downcase
         redirect_to :controller => 'agentoptions', :action => 'index'
       else
         flash.now[:notice] = "Invalid email/password combination"
         render 'new'
       end
    end


    if params[:session][:state].downcase == "customer"
       user = Customer.find_by(email: params[:session][:email].downcase)
       if user && user.authenticate(params[:session][:password])
         session[:member_id] = user.id
         session[:email]= user.email
         session[:state] = params[:session][:state].downcase
         redirect_to :controller => 'customeroptions', :action => 'index'
       else
         flash.now[:notice] = "Invalid email/password combination"
         render 'new'
       end
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    session.delete(:user_id)
    reset_session
    redirect_to root_url
  end
end
