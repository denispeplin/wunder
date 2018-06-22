# Wunder

Play with coordinates

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

Project includes `pairs.csv` (162 valid pairs) and `coordinates.csv` (1314 coordinates), but only 5
coordinates match to corresponding boxes.
