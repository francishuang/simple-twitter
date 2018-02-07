class UsersController < ApplicationController

  def tweets
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      flash.alert = "只能修改自己的資料喔！"
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.notice = "修改個人資料成功！"
      redirect_back fallback_location: root_path
    else
      render :edit
    end
  end

  def followings
    @followings # 基於測試規格，必須講定變數名稱
  end

  def followers
    @followers # 基於測試規格，必須講定變數名稱
  end

  def likes
    @likes # 基於測試規格，必須講定變數名稱
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :avatar)
  end

end
