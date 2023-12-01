json.extract! tattoo, :title, :specialization, :created_at
json.tattoo_image request.base_url + tattoo.tattoo_image.url
json.url api_v1_tattoo_url(tattoo, format: :json)
