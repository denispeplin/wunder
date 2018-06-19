use Mix.Config

config :wunder, Wunder.Repo,
  database: "wunder_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432",
  types: Wunder.PostgresTypes

config :logger, :console, level: :error
