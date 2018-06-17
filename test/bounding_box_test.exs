defmodule Wunder.BoundingBoxTest do
  use ExUnit.Case

  import Wunder.BoundingBox

  describe "from_pair" do
    test "A, B" do
      assert from_pair([{0, 0}, {1, 1}]) ==
               [
                 {0, 0},
                 {0, 1},
                 {1, 1},
                 {1, 0}
               ]
    end

    test "B, A" do
      assert from_pair([{1, 1}, {0, 0}]) ==
               [
                 {0, 0},
                 {0, 1},
                 {1, 1},
                 {1, 0}
               ]
    end

    test "C, D" do
      assert from_pair([{0, 1}, {1, 0}]) ==
               [
                 {0, 0},
                 {0, 1},
                 {1, 1},
                 {1, 0}
               ]
    end

    test "D, C" do
      assert from_pair([{1, 0}, {0, 1}]) ==
               [
                 {0, 0},
                 {0, 1},
                 {1, 1},
                 {1, 0}
               ]
    end

    test "lon1 == lon2" do
      assert is_nil(from_pair([{0, 0}, {0, 1}]))
    end

    test "lat1 == lat2" do
      assert is_nil(from_pair([{0, 0}, {1, 0}]))
    end

    test "lon1 == lon2, lat1 == lat2" do
      assert is_nil(from_pair([{0, 0}, {0, 0}]))
    end

    test "run on test data from pairs.csv" do
      boxes =
        Wunder.Pairs.read()
        |> Enum.map(&from_pair/1)
        |> Enum.filter(fn box -> !is_nil(box) end)

      assert boxes
      [first_box | _] = boxes

      assert first_box == [
               {120.99206, 14.75659},
               {120.99206, 14.756699999999999},
               {120.99287, 14.756699999999999},
               {120.99287, 14.75659}
             ]

      assert Enum.count(boxes) == 162
    end
  end
end
