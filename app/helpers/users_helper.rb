module UsersHelper
  def username_by_user_id_in_questions(question)
    User.find(question.user_id).username
  end
end
