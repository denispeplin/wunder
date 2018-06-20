use Mix.Config

config :wunder, Wunder.Repo,
  database: "wunder_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox,
  types: Wunder.PostgresTypes

config :logger, :console, level: :error
