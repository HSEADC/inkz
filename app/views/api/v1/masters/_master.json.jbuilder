json.extract! master, :id, :name, :nickname, :created_at
json.url api_v1_master_url(master, format: :json)

json.set! :new_url, new_api_v1_master_url
