defmodule Wunder.BoundingBox do
  @doc """
  Creates bounding box from [A, B[] or [C, D] pair: [A, C, B, D]
  C {lon1, lat2}  B {lon2, lat2}

  A {lon1, lat1}  D {lon2, lat1}

  Recursive calls serve to sort incoming pairs when they come in reverse order.

  Returns `nil` when lon1 == lon2 or lat1 == lat2
  """
  def from_pair([{lon2, lat2} = b, {lon1, lat1} = a]) when lon2 > lon1 and lat2 > lat1 do
    from_pair([a, b])
  end

  def from_pair([{lon1, lat1}, {lon2, lat2}]) when lon2 > lon1 and lat2 > lat1 do
    create_box(lon1, lon2, lat1, lat2)
  end

  def from_pair([{lon2, lat1} = d, {lon1, lat2} = c]) when lon2 > lon1 and lat2 > lat1 do
    from_pair([c, d])
  end

  def from_pair([{lon1, lat2}, {lon2, lat1}]) when lon2 > lon1 and lat2 > lat1 do
    create_box(lon1, lon2, lat1, lat2)
  end

  def from_pair(_pair), do: nil

  defp create_box(lon1, lon2, lat1, lat2) do
    [
      {lon1, lat1},
      {lon1, lat2},
      {lon2, lat2},
      {lon2, lat1}
    ]
  end
end
