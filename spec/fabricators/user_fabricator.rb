Fabricator(:user) do
  email 'email@example.com'
  username 'username'
  password 'password'
  id '1'
end

Fabricator(:admin, from: :user) do
  email 'admin@example.com'
  username 'username'
  password 'password'
  is_admin 'true'
  id '1'
end
