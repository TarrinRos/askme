module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def inclination(questions)
    questions_amount = questions.count

    if questions_amount == nil || !questions_amount.is_a?(Numeric)
      questions_amount = 0
    end

    remainder = questions_amount % 10
    remainder_100 = questions_amount % 100

    if remainder.between?(5, 9) || remainder_100.between?(11, 14) || remainder == 0
      "#{questions_amount} вопросов"
    elsif remainder.between?(2, 4)
      "#{questions_amount} вопросa"
    else
      "#{questions_amount} вопрос"
    end
  end
end