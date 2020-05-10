class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @name = @user.name
    @shops = @user.shops.order('created_at DESC')
    @reviews = @user.reviews.order('updated_at DESC')
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user), notice: 'プロフィールを編集しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_description, :user_image)
  end

end
