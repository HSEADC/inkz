json.array! @masters, partial: "api/v1/masters/master", as: :master
json.set! :create_url, api_v1_master_url
