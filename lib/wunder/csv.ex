defmodule Wunder.CSV do
  @data_dir Application.get_env(:wunder, :data_dir)

  def read!(filename) do
    @data_dir
    |> Path.join(filename)
    |> File.stream!()
    |> CSV.decode!(separator: ?,, headers: true)
  end

  def rows_to_coordinates(rows) do
    Enum.map(rows, fn row ->
      {
        parse_float(row["lon"]),
        parse_float(row["lat"])
      }
    end)
  end

  defp parse_float(coordinate) do
    {value, ""} = Float.parse(coordinate)
    value
  end
end
