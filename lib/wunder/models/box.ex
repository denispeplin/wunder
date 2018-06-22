defmodule Wunder.Models.Box do
  use Wunder, :model
  import Geo.PostGIS

  schema "boxes" do
    field(:geom, Geo.PostGIS.Geometry)

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:geom])
    |> validate_required(:geom)
  end

  def insert!(geom) do
    %Models.Box{}
    |> Models.Box.changeset(%{geom: geom})
    |> Repo.insert!()
  end

  def included_coordinates(box) do
    from(
      b in Models.Box,
      join: c in Models.Coordinate,
      on: st_contains(b.geom, c.geom),
      where: b.id == ^box.id,
      select: c
    )
    |> Repo.all()
  end

  def matching_coordinates do
    from(
      b in Models.Box,
      join: c in Models.Coordinate,
      on: st_contains(b.geom, c.geom)
    )
    |> Repo.all()
  end
end
