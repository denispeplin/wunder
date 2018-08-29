# Wunder

Play with coordinates. Get a task description [here](TASK_DESCRIPTION.md)

## Installation

```bash
mix deps.get
mix do ecto.create, ecto.migrate
```

## Usage

### Read pairs and create bounding boxes

```elixir
Wunder.BoundingBox.read()
```

### Save pairs + coordinates and match boxes

```elixir
Wunder.save_data() |> Wunder.Models.Box.matching_coordinates()
```

### Match pair of coordinates to a box

```elixir
box = Wunder.Repo.get!(Wunder.Models.Box, 123)
Wunder.PairToBox.match(box, [{1, 2}, {3, 4}])
```

## Testing

```elixir
MIX_ENV=test mix do ecto.create, ecto.migrate
mix test
```

## Notes

Project includes [pairs.csv](priv/data/pairs.csv) (162 valid pairs) and [coordinates.csv](priv/data/coordinates.csv) (1314 coordinates), but only 5
coordinates match to corresponding boxes.
