json.extract! news, :id, :title, :short, :created_at, :updated_at
json.url news_url(news, format: :json)
