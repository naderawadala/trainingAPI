defmodule TrainingAPI.SchemaTest do
  use TrainingAPI.DataCase

  alias TrainingAPI.Schema

  describe "news" do
    alias TrainingAPI.Schema.News

    import TrainingAPI.SchemaFixtures

    @invalid_attrs %{date: nil, headline: nil, publication: nil, text: nil}

    test "list_news/0 returns all news" do
      news = news_fixture()
      assert Schema.list_news() == [news]
    end

    test "get_news!/1 returns the news with given id" do
      news = news_fixture()
      assert Schema.get_news!(news.id) == news
    end

    test "create_news/1 with valid data creates a news" do
      valid_attrs = %{date: ~N[2022-05-15 07:54:00], headline: "some headline", publication: "some publication", text: "some text"}

      assert {:ok, %News{} = news} = Schema.create_news(valid_attrs)
      assert news.date == ~N[2022-05-15 07:54:00]
      assert news.headline == "some headline"
      assert news.publication == "some publication"
      assert news.text == "some text"
    end

    test "create_news/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_news(@invalid_attrs)
    end

    test "update_news/2 with valid data updates the news" do
      news = news_fixture()
      update_attrs = %{date: ~N[2022-05-16 07:54:00], headline: "some updated headline", publication: "some updated publication", text: "some updated text"}

      assert {:ok, %News{} = news} = Schema.update_news(news, update_attrs)
      assert news.date == ~N[2022-05-16 07:54:00]
      assert news.headline == "some updated headline"
      assert news.publication == "some updated publication"
      assert news.text == "some updated text"
    end

    test "update_news/2 with invalid data returns error changeset" do
      news = news_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_news(news, @invalid_attrs)
      assert news == Schema.get_news!(news.id)
    end

    test "delete_news/1 deletes the news" do
      news = news_fixture()
      assert {:ok, %News{}} = Schema.delete_news(news)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_news!(news.id) end
    end

    test "change_news/1 returns a news changeset" do
      news = news_fixture()
      assert %Ecto.Changeset{} = Schema.change_news(news)
    end
  end
end
