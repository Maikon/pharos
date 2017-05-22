use Mix.Config

config :pharos_web, parent_node: :"pharos@127.0.0.1"
config :pharos_web, children_nodes: [
  {:"wiki@127.0.0.1", Wikipedia.Search},
  {:"twitter@127.0.0.1", Twitter.Search}
]

config :pharos_web, search: FakeSearch

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pharos_web, PharosWeb.Endpoint,
  http: [port: 4001],
  server: false

config :pharos_web, ecto_repos: []

# Print only warnings and errors during test
config :logger, level: :warn
