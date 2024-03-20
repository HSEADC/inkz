json.set! :jti, User.find_by_email("user1@inkz.ru").jti

json.set! :tattoos do
  json.array! @tattoos, partial: "api/v1/tattoos/tattoo", as: :tattoo
end
