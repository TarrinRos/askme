class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Alex',
        username: 'alexatar',
        avatar_url: 'https://ru.gravatar.com/userimage/21555925/f87b9376098bcb73b7c4a7f1819c802e.png'
    ),
      User.new(
        id: 2,
        name: 'Vasya',
        username: 'vasilli')
    ]
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

    @questions = [
      Question.new(text: 'Hello, how do you do?', created_at: Date.parse('01.12.2018')),
      Question.new(text: 'What?', created_at: Date.parse('02.12.2018'))
    ]

    @new_question = Question.new
  end
end
