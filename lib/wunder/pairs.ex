defmodule Wunder.Pairs do
  @filename "pairs.csv"

  @doc """
  Reads lat/lon pairs, places them into list of tuple pairs
  [[{lon, lat}, {lon, lat}], ...]]
  """
  def read do
    @filename
    |> Wunder.CSV.read!()
    |> Wunder.CSV.rows_to_coordinates()
    |> Enum.chunk_every(2)
  end
end
