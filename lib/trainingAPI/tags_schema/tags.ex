defmodule TrainingAPI.TagsSchema.Tags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string
    many_to_many :news, TrainingAPI.Schema.News, join_through: "news_tags"
  end

  @doc false
  def changeset(tags, attrs) do
    tags
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
