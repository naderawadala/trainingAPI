defmodule TrainingAPIWeb.News_TagsControllerTest do
  use TrainingAPIWeb.ConnCase

  import TrainingAPI.NewsTagsSchemaFixtures

  alias TrainingAPI.NewsTagsSchema.News_Tags

  @create_attrs %{
    news_id: 42,
    tag_id: 42
  }
  @update_attrs %{
    news_id: 43,
    tag_id: 43
  }
  @invalid_attrs %{news_id: nil, tag_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all news_tags", %{conn: conn} do
      conn = get(conn, Routes.news__tags_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create news__tags" do
    test "renders news__tags when data is valid", %{conn: conn} do
      conn = post(conn, Routes.news__tags_path(conn, :create), news__tags: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.news__tags_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "news_id" => 42,
               "tag_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.news__tags_path(conn, :create), news__tags: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update news__tags" do
    setup [:create_news__tags]

    test "renders news__tags when data is valid", %{conn: conn, news__tags: %News_Tags{id: id} = news__tags} do
      conn = put(conn, Routes.news__tags_path(conn, :update, news__tags), news__tags: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.news__tags_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "news_id" => 43,
               "tag_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, news__tags: news__tags} do
      conn = put(conn, Routes.news__tags_path(conn, :update, news__tags), news__tags: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete news__tags" do
    setup [:create_news__tags]

    test "deletes chosen news__tags", %{conn: conn, news__tags: news__tags} do
      conn = delete(conn, Routes.news__tags_path(conn, :delete, news__tags))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.news__tags_path(conn, :show, news__tags))
      end
    end
  end

  defp create_news__tags(_) do
    news__tags = news__tags_fixture()
    %{news__tags: news__tags}
  end
end
