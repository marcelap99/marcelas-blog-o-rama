class SessionsController < ApplicationController
  def new
  end

   #user is signed in on submit (post method)
    def create
      @user = User.find_by(fname: params[:session][:fname])

     if @user == nil

         flash[:notice] = "Your name or password do not exist."

         session[:user_id] = nil

         redirect_to "/sessions/new"

     elsif @user && @user.password == params[:session][:password]
            session[:user_id] = @user.id

           redirect_to "/users/index"
      else
          flash[:notice] = "Your name and password do not match."

         session[:user_id] = nil

         redirect_to "/sessions/new"
      end
    end


   def destroy
      session[:user_id] = nil
      redirect_to "/"
    end
  end
