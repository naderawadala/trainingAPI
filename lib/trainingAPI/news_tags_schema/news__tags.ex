defmodule TrainingAPI.NewsTagsSchema.News_Tags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news_tags" do
    field :news_id, :integer
    field :tags_id, :integer

  end

  @doc false
  def changeset(news__tags, attrs) do
    news__tags
    |> cast(attrs, [:news_id, :tags_id])
    |> validate_required([:news_id, :tags_id])
  end
end
