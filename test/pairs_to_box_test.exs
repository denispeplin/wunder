defmodule Wunder.PairToBoxTest do
  use Wunder.ModelCase
  import Wunder.PairToBox

  describe "match" do
    test "matches box to coordinates pair" do
      # standard box [{0, 0}, {1, 1}]
      box = insert(:box)

      assert match(box, [{0.5, 0.5}, {0.5, 0.5}]) == [box]
      assert match(box, [{0.5, 0.5}, {2, 2}]) == [box]
      assert match(box, [{2, 2}, {0.5, 0.5}]) == [box]
      assert match(box, [{2, 2}, {2, 2}]) == []
    end
  end

  describe "save_pair_to_box" do
    test "gets pair, converts it to polygon and saves to db" do
      box = save_pair_to_box([{2, 2}, {3, 3}])
      assert box
      assert box.id

      assert box.geom == %Geo.Polygon{
               coordinates: [[{2, 2}, {2, 3}, {3, 3}, {3, 2}, {2, 2}]],
               properties: %{},
               srid: 4326
             }
    end
  end
end
