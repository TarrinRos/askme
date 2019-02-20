ActiveAdmin.register User do
  index do
    column :username
    column :email
    actions
  end
end
