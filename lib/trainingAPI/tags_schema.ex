defmodule TrainingAPI.TagsSchema do
  @moduledoc """
  The TagsSchema context.
  """

  import Ecto.Query, warn: false
  alias TrainingAPI.Repo

  alias TrainingAPI.TagsSchema.Tags

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tags{}, ...]

  """
  def list_tags do
    Repo.all(Tags)
  end

  @doc """
  Gets a single tags.

  Raises `Ecto.NoResultsError` if the Tags does not exist.

  ## Examples

      iex> get_tags!(123)
      %Tags{}

      iex> get_tags!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tags!(id), do: Repo.get!(Tags, id)

  @doc """
  Creates a tags.

  ## Examples

      iex> create_tags(%{field: value})
      {:ok, %Tags{}}

      iex> create_tags(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tags(attrs \\ %{}) do
    %Tags{}
    |> Tags.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tags.

  ## Examples

      iex> update_tags(tags, %{field: new_value})
      {:ok, %Tags{}}

      iex> update_tags(tags, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tags(%Tags{} = tags, attrs) do
    tags
    |> Tags.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tags.

  ## Examples

      iex> delete_tags(tags)
      {:ok, %Tags{}}

      iex> delete_tags(tags)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tags(%Tags{} = tags) do
    Repo.delete(tags)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tags changes.

  ## Examples

      iex> change_tags(tags)
      %Ecto.Changeset{data: %Tags{}}

  """
  def change_tags(%Tags{} = tags, attrs \\ %{}) do
    Tags.changeset(tags, attrs)
  end
end
