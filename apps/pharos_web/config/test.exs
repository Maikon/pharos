use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pharos_web, PharosWeb.Endpoint,
  http: [port: 4001],
  server: false

config :pharos_web, ecto_repos: []

# Print only warnings and errors during test
config :logger, level: :warn
