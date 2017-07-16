require "slack"

# 自分のアクセストークンを代入
Slack.configure do |config|
  config.token = "MY KEY"
end