Postgrex.Types.define(
  Wunder.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison
)

defmodule Wunder.Repo do
  use Ecto.Repo,
    otp_app: :wunder,
    adapter: Ecto.Adapters.Postgres
end
