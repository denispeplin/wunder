defmodule Wunder.Models.CoordinateTest do
  use Wunder.ModelCase

  describe "permanent storage" do
    test "insert and select a coordinate" do
      geom = %Geo.Point{coordinates: {30, -90}, srid: 4326}

      record =
        %Wunder.Models.Coordinate{}
        |> Wunder.Models.Coordinate.changeset(%{geom: geom})
        |> Wunder.Repo.insert!()

      assert record
      assert record.id
      assert record.geom == geom
    end
  end
end
