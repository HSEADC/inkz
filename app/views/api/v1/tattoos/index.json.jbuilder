json.set! :new_url, @new_tattoo_url

json.set! :tattoos do
  json.array! @tattoos, partial: "api/v1/tattoos/tattoo", as: :tattoo
end
