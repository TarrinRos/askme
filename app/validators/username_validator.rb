class UsernameValidator < ActiveModel::EachValidator
  def validate_each(user, attribute, value)
    unless value =~ /\A[a-zA-Z0-9_]+\z/i
      user.errors[attribute] << (options[:message] || 'Неверный формат имени пользователя')
    end
  end
end