defmodule ElixirCasts.Repo.Migrations.CreateEpisode do
  use Ecto.Migration

  def change do
    create table(:episodes) do
      add :title, :string
      add :description, :text
      add :link, :string
      add :guid, :string
      add :pub_date, :string
      add :video_url, :string

      timestamps
    end
  end
end
