defmodule Wunder.PairsTest do
  use ExUnit.Case

  describe "read" do
    test "places pairs data into tuples" do
      tuples = Wunder.Pairs.read()

      assert tuples
      [first_row | _] = tuples

      assert first_row == [
               {120.99287, 14.75659},
               {120.99206, 14.756699999999999}
             ]

      assert Enum.count(tuples) == 164
    end
  end
end
