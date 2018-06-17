defmodule Wunder.Coordinates do
  @filename "coordinates.csv"

  def read do
    @filename
    |> Wunder.CSV.read!()
    |> Wunder.CSV.rows_to_coordinates()
  end
end
