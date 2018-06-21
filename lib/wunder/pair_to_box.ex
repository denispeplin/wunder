defmodule Wunder.PairToBox do
  import Ecto.Query, only: [from: 2]
  import Geo.PostGIS
  alias Wunder.BoundingBox
  alias Wunder.Repo
  alias Wunder.Models

  def match(box, coordinates) do
    [geom1, geom2] = Enum.map(coordinates, &Wunder.Coordinates.to_geom/1)

    from(
      b in Models.Box,
      where: b.id == ^box.id,
      where: st_contains(b.geom, ^geom1) or st_contains(b.geom, ^geom2)
    )
    |> Repo.all()
  end

  def save_pair_to_box(pair) do
    pair
    |> BoundingBox.from_pair()
    |> BoundingBox.to_geom()
    |> Models.Box.insert!()
  end
end
