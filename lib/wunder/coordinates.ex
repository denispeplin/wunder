defmodule Wunder.Coordinates do
  @filename "coordinates.csv"

  def read do
    @filename
    |> Wunder.CSV.read!()
    |> Wunder.CSV.rows_to_coordinates()
  end

  def to_geom({lon, lat}) do
    %Geo.Point{coordinates: {lon, lat}, srid: 4326}
  end
end
