defmodule TrainingAPI.SchemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrainingAPI.Schema` context.
  """

  @doc """
  Generate a news.
  """
  def news_fixture(attrs \\ %{}) do
    {:ok, news} =
      attrs
      |> Enum.into(%{
        date: ~N[2022-05-15 07:54:00],
        headline: "some headline",
        publication: "some publication",
        text: "some text"
      })
      |> TrainingAPI.Schema.create_news()

    news
  end
end
