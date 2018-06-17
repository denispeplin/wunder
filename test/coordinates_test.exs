defmodule Wunder.CoordinatesTest do
  use ExUnit.Case

  describe "read" do
    test "places coordinates into tuples" do
      coordinates = Wunder.Coordinates.read()

      assert coordinates
      [first_coordinate | _] = coordinates

      assert first_coordinate == {120.9931, 14.7583}

      assert Enum.count(coordinates) == 1309
    end
  end
end
