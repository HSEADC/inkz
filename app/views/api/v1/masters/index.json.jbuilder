json.array! @masters, partial: "api/v1/masters/master", as: :master do |master|
  json.partial! "api/v1/masters/master", master: master
  json.set! :create_url, api_v1_master_url(:master)
end
