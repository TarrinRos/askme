class HexColorValidator < ActiveModel::EachValidator
  def validate_each(user, attribute, value)
    unless value =~ /\A#([[:xdigit:]]{3}){1,2}\z/i
      user.errors[attribute] << (options[:message] || 'Это не 16-ричный код цвета')
    end
  end
end