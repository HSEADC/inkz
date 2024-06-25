json.extract! tattoo, :title, :created_at
if tattoo.tattoo_image.present?
  json.tattoo_image request.base_url + tattoo.tattoo_image.url
end
json.url api_v1_tattoo_url(tattoo, format: :json)
