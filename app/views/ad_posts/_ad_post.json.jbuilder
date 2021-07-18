json.extract! ad_post, :id, :title, :description, :created_at, :updated_at
json.url ad_post_url(ad_post, format: :json)
