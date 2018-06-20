defmodule Wunder.Models.Coordinate do
  use Wunder, :model

  schema "coordinates" do
    field(:geom, Geo.PostGIS.Geometry)

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:geom])
    |> validate_required(:geom)
  end

  def insert!(geom) do
    %Models.Coordinate{}
    |> Models.Coordinate.changeset(%{geom: geom})
    |> Repo.insert!()
  end
end
