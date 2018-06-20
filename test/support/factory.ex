defmodule Wunder.Factory do
  use ExMachina.Ecto, repo: Wunder.Repo
  alias Wunder.Models

  def box_factory do
    geom = %Geo.Polygon{
      coordinates: [
        [{0, 0}, {0, 1}, {1, 1}, {1, 0}, {0, 0}]
      ],
      srid: 4326
    }

    %Models.Box{
      geom: geom
    }
  end

  def coordinate_factory do
    geom = %Geo.Point{coordinates: {0.5, 0.5}, srid: 4326}

    %Models.Coordinate{
      geom: geom
    }
  end
end
