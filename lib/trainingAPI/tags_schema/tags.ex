defmodule TrainingAPI.TagsSchema.Tags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string

  end

  @doc false
  def changeset(tags, attrs) do
    tags
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
