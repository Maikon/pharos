use Mix.Config

config :logger, level: :info

config :db_service, DbService.Repo,
  adapter: Ecto.Adapters.Postgres,
  ssl: false,
  username: "System.get_env(DB_USER)",
  password: "System.get_env(DB_PASSWORD)",
  database: "System.get_env(DB_NAME)",
  hostname: "System.get_env(DB_HOST)",
  pool_size: 20
