defmodule TrainingAPI.NewsTagsSchema do
  @moduledoc """
  The NewsTagsSchema context.
  """

  import Ecto.Query, warn: false
  alias TrainingAPI.Repo
  alias TrainingAPI.NewsTagsSchema.News_Tags

  @doc """
  Returns the list of news_tags.

  ## Examples

      iex> list_news_tags()
      [%News_Tags{}, ...]

  """
  def list_news_tags do
    Repo.all(News_Tags)
  end

  @doc """
  Gets a single news__tags.

  Raises `Ecto.NoResultsError` if the News  tags does not exist.

  ## Examples

      iex> get_news__tags!(123)
      %News_Tags{}

      iex> get_news__tags!(456)
      ** (Ecto.NoResultsError)

  """
  def get_news__tags!(id), do: Repo.get!(News_Tags, id)

  @doc """
  Creates a news__tags.

  ## Examples

      iex> create_news__tags(%{field: value})
      {:ok, %News_Tags{}}

      iex> create_news__tags(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_news__tags(attrs \\ %{}) do
    %News_Tags{}
    |> News_Tags.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a news__tags.

  ## Examples

      iex> update_news__tags(news__tags, %{field: new_value})
      {:ok, %News_Tags{}}

      iex> update_news__tags(news__tags, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_news__tags(%News_Tags{} = news__tags, attrs) do
    news__tags
    |> News_Tags.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a news__tags.

  ## Examples

      iex> delete_news__tags(news__tags)
      {:ok, %News_Tags{}}

      iex> delete_news__tags(news__tags)
      {:error, %Ecto.Changeset{}}

  """
  def delete_news__tags(%News_Tags{} = news__tags) do
    Repo.delete(news__tags)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking news__tags changes.

  ## Examples

      iex> change_news__tags(news__tags)
      %Ecto.Changeset{data: %News_Tags{}}

  """
  def change_news__tags(%News_Tags{} = news__tags, attrs \\ %{}) do
    News_Tags.changeset(news__tags, attrs)
  end


end
