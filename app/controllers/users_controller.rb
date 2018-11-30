class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
                  name: 'Alex',
                  username: 'alexatar',
    avatar_url: 'https://ru.gravatar.com/userimage/21555925/f87b9376098bcb73b7c4a7f1819c802e.png'
    )
  end
end
