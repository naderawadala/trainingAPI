defmodule TrainingAPI.Repo.Migrations.FixTimestamps do
  use Ecto.Migration

  def change do
    alter table(:news) do
      modify :inserted_at, :utc_datetime, default: fragment("NOW()")
      modify :updated_at, :utc_datetime, default: fragment("NOW()")
    end
    alter table(:tags) do
      modify :inserted_at, :utc_datetime, default: fragment("NOW()")
      modify :updated_at, :utc_datetime, default: fragment("NOW()")
    end
  end
end
