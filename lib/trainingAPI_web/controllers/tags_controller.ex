defmodule TrainingAPIWeb.TagsController do
  use TrainingAPIWeb, :controller

  alias TrainingAPI.TagsSchema
  alias TrainingAPI.TagsSchema.Tags

  action_fallback TrainingAPIWeb.FallbackController

  def index(conn, _params) do
    tags = TagsSchema.list_tags()
    render(conn, "index.json", tags: tags)
  end

  def create(conn, %{"tags" => tags_params}) do
    with {:ok, %Tags{} = tags} <- TagsSchema.create_tags(tags_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tags_path(conn, :show, tags))
      |> render("show.json", tags: tags)
    end
  end

  def show(conn, %{"id" => id}) do
    tags = TagsSchema.get_tags!(id)
    render(conn, "show.json", tags: tags)
  end

  def update(conn, %{"id" => id, "tags" => tags_params}) do
    tags = TagsSchema.get_tags!(id)

    with {:ok, %Tags{} = tags} <- TagsSchema.update_tags(tags, tags_params) do
      render(conn, "show.json", tags: tags)
    end
  end

  def delete(conn, %{"id" => id}) do
    tags = TagsSchema.get_tags!(id)

    with {:ok, %Tags{}} <- TagsSchema.delete_tags(tags) do
      send_resp(conn, :no_content, "")
    end
  end
end
