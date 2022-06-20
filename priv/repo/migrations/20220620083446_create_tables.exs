defmodule TrainingAPI.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table("news") do
    add :date, :utc_datetime
    add :headline, :string
    add :publication, :string
    add :text, :string

    timestamps()
    end

    create table("tags") do
      add :name, :string
      timestamps()
    end

    create table("news_tags", primary_key: false) do
    add :news_id, references(:news)
    add :tags_id, references(:news)
    end
  end
end
