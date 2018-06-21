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
end
