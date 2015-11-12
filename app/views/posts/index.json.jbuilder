json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :post_time
  json.url post_url(post, format: :json)
end
