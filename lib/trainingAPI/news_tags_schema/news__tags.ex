defmodule TrainingAPI.NewsTagsSchema.News_Tags do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news_tags" do
    field :news_id, :integer
    field :tag_id, :integer

    timestamps()
  end

  @doc false
  def changeset(news__tags, attrs) do
    news__tags
    |> cast(attrs, [:news_id, :tag_id])
    |> validate_required([:news_id, :tag_id])
  end
end
