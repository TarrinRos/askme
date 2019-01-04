module QuestionsHelper
  def inclination(questions, voprosov, voprosa, vopros)
    amount = questions

    if amount == nil || !amount.is_a?(Numeric)
      amount = 0
    end

    remainder = amount % 10
    remainder_100 = amount % 100

    if remainder.between?(5, 9) || remainder_100.between?(11, 14) || remainder == 0
      voprosov
    elsif remainder.between?(2, 4)
      voprosa
    else
      vopros
    end
  end

  def render_with_hashtag(text)
    text.gsub(/#[[:word:]]+/) { |hashtag| link_to hashtag, hashtag_path(hashtag.delete('#'))}.html_safe
  end
end
