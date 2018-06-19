defmodule Wunder.Repo.Migrations.CreateCoordinates do
  use Ecto.Migration

  def up do
    create table(:coordinates) do
      timestamps()
    end

    execute """
    ALTER TABLE coordinates
    ADD COLUMN geom geometry(Point, 4326)
    NOT NULL
    """

    execute """
    CREATE INDEX coordinates_geom_index
    ON coordinates USING gist (geom)
    """
  end

  def down do
    drop table(:coordinates)
  end
end
