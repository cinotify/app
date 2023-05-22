class Discord
  def self.post_message(content)
    uri = URI(Rails.application.credentials.discord[:webhook_url])
    body = { content: }
    headers = { 'Content-Type': 'application/json' }
    response = Net::HTTP.post(uri, body.to_json, headers)
  end
end
