class UsersController < ApplicationController
  before_action :set_user, only: [:update, :show, :destroy]

  api :POST, '/user', "Create User"
	def create
		@user = User.new(user_params)
		if @user.save
      render json: @user, status: 200
    else
      render json: { errors: @user.errors }, status: 422
    end
	end

  api :GET, '/user/:id', "Show specific User"
  param :id, :number
	def show
	  begin
        render json: @user, status: 200
    rescue
        head 404
    end
	end

  api :PUT, '/user/:id', "Update specific User"
  param :id, :number
  def update
    if @user.update(user_params)
        render json: @user, status: 200
    else
        render json: { errors: @user.errors }, status: 422
    end
  end

  api :PUT, '/user/:id', "Delete specific User"
  param :id, :number
  def destroy
    if @user.destroy
        render json: @user, status: 200
    else
        render json: { errors: @user.errors }, status: 422
    end
  end

	private

  def user_params
    params.permit(:name, :email, :gender, :age)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
