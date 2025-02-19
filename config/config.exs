# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :paybank,
  ecto_repos: [Paybank.Repo]

# Configures the endpoint
config :paybank, PaybankWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: PaybankWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Paybank.PubSub,
  live_view: [signing_salt: "6MuwXR2T"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
