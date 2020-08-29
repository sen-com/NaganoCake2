class EndUsersController < ApplicationController
  before_action :end_use_is_working
  before_action :authenticate_end_user!
  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to end_users_path
    else
      render :edit
    end
  end

  def leave_user
    @end_user = current_end_user
  end

  def leave
    @end_user = current_end_user
    @end_user.update(is_working: false)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :address, :phone_number, :postal_code)
  end
  def end_use_is_working
    unless current_end_user.is_working
      redirect_to destroy_end_user_session_path
    end
  end

end
