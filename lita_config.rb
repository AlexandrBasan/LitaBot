require './custom/bot'

Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Lita"

  # The locale code for the language to use.
  # config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  #config.robot.adapter = :shell

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  require 'yaml'
  secrets = YAML.load_file('secrets.yml')

  ## Example: Set options for the Redis connection.
  config.redis.host = secrets.inspect['development']['redis_host']
  config.redis.port = secrets.inspect['development']['redis_port']

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"

  config.robot.adapter = :slack
  config.adapters.slack.token = secrets['production']['slack_token']

  config.adapters.shell.private_chat = true

  # Heroku
  #config.redis.host = @secrets.inspect['production']['redis_host']
  #config.redis.port = @secrets.inspect['production']['redis_port']
end
