defmodule TrainingAPI.Schema.News do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news" do
    field :date, :utc_datetime
    field :headline, :string
    field :publication, :string
    field :text, :string
    many_to_many :tags, TrainingAPI.TagsSchema.Tags, join_through: "news_tags"

  end

  @doc false
  def changeset(news, attrs) do
    news
    |> cast(attrs, [:headline, :text, :publication, :date])
    |> validate_required([:headline, :text, :publication, :date, :tags])
  end
end
