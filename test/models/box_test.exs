defmodule Wunder.Models.BoxTest do
  use ExUnit.Case

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
end
