class UsersController < ApplicationController
  def new
    if session[:current_user_id]
      flash[:notice] = 'You are logged in.'
      redirect_to users_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = 'You are logged in successfully.'
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.first.to_s
      redirect_to new_user_path
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    session[:current_user_id] = nil
    flash[:notice] = 'You are successfully logged out.'
    redirect_to new_user_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
