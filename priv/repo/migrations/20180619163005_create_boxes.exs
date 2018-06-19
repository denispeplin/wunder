defmodule Wunder.Repo.Migrations.CreateBoxes do
  use Ecto.Migration

  def change do
    create table(:boxes) do
      timestamps()
    end

    execute """
    ALTER TABLE boxes
    ADD COLUMN geom geometry(Polygon, 4326)
    NOT NULL
    """

    execute """
    CREATE INDEX boxes_geom_index
    ON boxes USING gist (geom)
    """
  end

  def down do
    drop table(:boxes)
  end
end
