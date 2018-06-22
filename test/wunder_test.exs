defmodule WunderTest do
  use Wunder.ModelCase

  describe "save_data" do
    test "loads data from csv and saves it to database" do
      Wunder.save_data()

      assert Models.Box |> Repo.all() |> Enum.count() == 162
      assert Models.Coordinate |> Repo.all() |> Enum.count() == 1314

      coordinates_within_boxes = Wunder.Models.Box.matching_coordinates()

      assert length(coordinates_within_boxes) == 5
    end
  end
end
