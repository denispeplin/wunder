defmodule Wunder.Pairs do
  @filename "pairs.csv"
  @data_dir Application.get_env(:wunder, :data_dir)

  @doc """
  Reads lat/lon pairs, places them into list of tuple pairs
  [[{lon, lat}, {lon, lat}], ...]]
  """
  def read do
    @data_dir
    |> Path.join(@filename)
    |> File.stream!()
    |> CSV.decode!(separator: ?,, headers: true)
    |> Enum.map(fn row ->
      {
        parse_float(row["lon"]),
        parse_float(row["lat"])
      }
    end)
    |> Enum.chunk_every(2)
  end

  defp parse_float(coordinate) do
    {value, ""} = Float.parse(coordinate)
    value
  end
end
