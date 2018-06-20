defmodule Wunder.Models.BoxTest do
  use Wunder.ModelCase
  import Wunder.Models.Box

  describe "permanent storage" do
    test "insert and select a coordinate" do
      geom = %Geo.Polygon{
        coordinates: [
          [{0, 0}, {0, 1}, {1, 1}, {1, 0}, {0, 0}]
        ],
        srid: 4326
      }

      record =
        %Wunder.Models.Box{}
        |> Wunder.Models.Box.changeset(%{geom: geom})
        |> Wunder.Repo.insert!()

      assert record
      assert record.id
      assert record.geom == geom
    end
  end

  describe "included_coordinates" do
    test "returns coordinates inside box" do
      # standard box [{0,0}, {1,1}]
      box = insert(:box)
      # other box
      insert(:box)
      # standard coordinate {0.5, 0.5}
      coordinate = insert(:coordinate)
      # coordinates out of range
      [{-1, -1}, {2, 2}]
      |> Enum.each(fn {lon, lat} ->
        geom = %Geo.Point{coordinates: {lon, lat}, srid: 4326}
        build(:coordinate, geom: geom) |> insert
      end)

      assert included_coordinates(box) == [coordinate]
    end
  end
end
