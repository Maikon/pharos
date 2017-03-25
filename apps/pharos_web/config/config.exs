# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :pharos_web, PharosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0wA3Y/ON9NVp/J55xlbK47FK9BA6OkTNKXHjnoXgNeQIwHn66VgZ9Op+d4hWJLfo",
  render_errors: [view: PharosWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PharosWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
