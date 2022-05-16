defmodule TrainingAPIWeb.News_TagsController do
  use TrainingAPIWeb, :controller

  alias TrainingAPI.NewsTagsSchema
  alias TrainingAPI.NewsTagsSchema.News_Tags

  action_fallback TrainingAPIWeb.FallbackController

  def index(conn, _params) do
    news_tags = NewsTagsSchema.list_news_tags()
    render(conn, "index.json", news_tags: news_tags)
  end

  def create(conn, %{"news__tags" => news__tags_params}) do
    with {:ok, %News_Tags{} = news__tags} <- NewsTagsSchema.create_news__tags(news__tags_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.news__tags_path(conn, :show, news__tags))
      |> render("show.json", news__tags: news__tags)
    end
  end

  def show(conn, %{"id" => id}) do
    news__tags = NewsTagsSchema.get_news__tags!(id)
    render(conn, "show.json", news__tags: news__tags)
  end

  def update(conn, %{"id" => id, "news__tags" => news__tags_params}) do
    news__tags = NewsTagsSchema.get_news__tags!(id)

    with {:ok, %News_Tags{} = news__tags} <- NewsTagsSchema.update_news__tags(news__tags, news__tags_params) do
      render(conn, "show.json", news__tags: news__tags)
    end
  end

  def delete(conn, %{"id" => id}) do
    news__tags = NewsTagsSchema.get_news__tags!(id)

    with {:ok, %News_Tags{}} <- NewsTagsSchema.delete_news__tags(news__tags) do
      send_resp(conn, :no_content, "")
    end
  end
end
