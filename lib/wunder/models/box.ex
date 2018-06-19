defmodule Wunder.Models.Box do
  use Wunder, :model

  schema "boxes" do
    field(:geom, Geo.PostGIS.Geometry)

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:geom])
    |> validate_required(:geom)
  end
end
