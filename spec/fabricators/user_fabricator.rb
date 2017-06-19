Fabricator(:user) do
  email 'email@example.com'
  username 'username'
  password 'password'
  confirmed_email true
end

Fabricator(:admin, from: :user) do
  email 'admin@example.com'
  username 'username'
  password 'password'
  is_admin 'true'
end

Fabricator(:super_user, from: :admin) do
  email 'superuser@example.com'
  is_super_user 'true'
end
