class EmailValidator < ActiveModel::EachValidator
  def validate_each(user, attribute, value)
    unless value =~ /\A[^@]+@[^@]+\z/i
      user.errors[attribute] << (options[:message] || 'Неверный формат электронной почты')
    end
  end
end