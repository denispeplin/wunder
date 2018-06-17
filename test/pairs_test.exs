defmodule Wunder.PairsTest do
  use ExUnit.Case

  describe "read" do
    test "places pairs data into tuples" do
      pairs = Wunder.Pairs.read()

      assert pairs
      [first_pair | _] = pairs

      assert first_pair == [
               {120.99287, 14.75659},
               {120.99206, 14.756699999999999}
             ]

      assert Enum.count(pairs) == 164
    end
  end
end
