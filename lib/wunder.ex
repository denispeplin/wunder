defmodule Wunder do
  alias Wunder.Models
  alias Wunder.Repo

  def save_data do
    coordinates = Wunder.Coordinates.read()
    boxes = Wunder.BoundingBox.read()

    Repo.transaction(fn ->
      Enum.map(coordinates, fn coordinate ->
        coordinate
        |> Wunder.Coordinates.to_geom()
        |> Models.Coordinate.insert!()
      end)

      Enum.map(boxes, fn box ->
        box
        |> Wunder.BoundingBox.to_geom()
        |> Models.Box.insert!()
      end)
    end)
  end

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
      alias Wunder.Repo
      alias Wunder.Models
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
