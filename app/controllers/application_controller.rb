class ApplicationController < ActionController::Base
  include SessionsHelper

  helper_method :current_user
  helper_method :destroy_user_questions

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def reject_user
    redirect_to root_path, alert: 'Вам сюда запрещено!'
  end

  def destroy_user_questions(user)
    questions = Question.where(user_id: user.id)
    questions.destroy_all
  end
end
