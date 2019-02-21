ActiveAdmin.register Question do
  scope("answered") { |scope| scope.where.not(answer: nil) }
  scope("unanswered") { |scope| scope.where(answer: nil) }

  index do
    column 'To user', :user
    column :text
    column :answer
    column :author
    column 'Published at',:created_at
    actions
  end
end
