defmodule TrainingAPI.NewsTagsSchemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrainingAPI.NewsTagsSchema` context.
  """

  @doc """
  Generate a news__tags.
  """
  def news__tags_fixture(attrs \\ %{}) do
    {:ok, news__tags} =
      attrs
      |> Enum.into(%{
        id: 42,
        news_id: 42,
        tags_id: 42
      })
      |> TrainingAPI.NewsTagsSchema.create_news__tags()

    news__tags
  end
end
