class UsersController < ApplicationController
  before_action :load_user, except: [:index, :new, :create]

  before_action :autorize_user, except: [:index, :new, :create, :show]

  def index
    @users = User.all
  end

  def new
    redirect_to root_url, alert: 'Вы уже вошли' if current_user.present?

    @user = User.new
  end

  def create
    redirect_to root_url, alert: 'Вы уже вошли' if current_user.present?

    @user = User.new(user_params)
    if @user.save
      # Calls method from session helper for login upon signing up
      log_in(@user)
      redirect_to root_url, notice: 'Пользователь успешно зарегистрирован!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные успешно обновленны'
    else
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)

    @new_question = @user.questions.build
  end

  def destroy
    destroy_user_questions(@user)
    @user.destroy
    redirect_to root_path, notice: 'Пользователь удален.'
  end

  private

  def autorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url)
  end
end
