defmodule TrainingAPI.TagsSchemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TrainingAPI.TagsSchema` context.
  """

  @doc """
  Generate a tags.
  """
  def tags_fixture(attrs \\ %{}) do
    {:ok, tags} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> TrainingAPI.TagsSchema.create_tags()

    tags
  end
end
