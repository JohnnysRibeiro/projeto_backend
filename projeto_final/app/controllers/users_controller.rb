class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :destroy]

	def create
		@user = User.new(user_params)
		if @user.save
      render json: @user, status: 200
    else
      render json: { errors: @user.errors }, status: 422
    end
	end

	def show
	  begin
        render json: @user, status: 200
    rescue
        head 404
    end
	end

  def update
    if @user.update(user_params)
        render json: @user, status: 200
    else
        render json: { errors: @user.errors }, status: 422
    end
  end

  def destroy
    if @user.destroy
        render json: @user, status: 200
    else
        render json: { errors: @user.errors }, status: 422
    end
  end

  def index
  	users = User.all
  	render json: users, status: 200
  end

	private

  def user_params
    # whitelist params
    params.permit(:name, :email, :gender, :age)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
