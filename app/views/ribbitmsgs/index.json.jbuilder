json.array!(@ribbitmsgs) do |ribbitmsg|
  json.extract! ribbitmsg, :content, :references
  json.url ribbitmsg_url(ribbitmsg, format: :json)
end
