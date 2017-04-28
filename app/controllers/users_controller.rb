class UsersController < ApplicationController


    def create
      @user = User.new(
        fname: params[:user][:fname],
        lname: params[:user][:lname],
        password: params[:user][:password]
      )

      if @user.save
        session[:current_user_id] = @user.id
        flash[:notice] = "The user was created"
        redirect_to user_path(@user)
      else
        flash[:alert] = "The user was not created"
        redirect_to new_user_path
      end
    end


  def new
      @user = User.new
    end

  def index

        @users = User.all
    end

  def edit
          @user = User.find(params[:id])
    end

  def update
  @user = User.find(params[:id])
  @user.fname = params[:user][:fname]
  @user.lname = params[:user][:lname]

  if @user.save
    flash[:notice] = "The user was updated"
    redirect_to user_path(@user)
  else
    flash[:alert] = "The user was not updated"
    redirect_to edit_user_path(@user)
  end

end

def show
  @user = User.find(session[:current_user_id])
end


def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:notice] = "User was deleted"
    else
      flash[:alert] = "User could not be deleted"
    end

    redirect_to users_path
  end









end
