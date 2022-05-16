defmodule TrainingAPI.NewsTagsSchemaTest do
  use TrainingAPI.DataCase

  alias TrainingAPI.NewsTagsSchema

  describe "news_tags" do
    alias TrainingAPI.NewsTagsSchema.News_Tags

    import TrainingAPI.NewsTagsSchemaFixtures

    @invalid_attrs %{news_id: nil, tag_id: nil}

    test "list_news_tags/0 returns all news_tags" do
      news__tags = news__tags_fixture()
      assert NewsTagsSchema.list_news_tags() == [news__tags]
    end

    test "get_news__tags!/1 returns the news__tags with given id" do
      news__tags = news__tags_fixture()
      assert NewsTagsSchema.get_news__tags!(news__tags.id) == news__tags
    end

    test "create_news__tags/1 with valid data creates a news__tags" do
      valid_attrs = %{news_id: 42, tag_id: 42}

      assert {:ok, %News_Tags{} = news__tags} = NewsTagsSchema.create_news__tags(valid_attrs)
      assert news__tags.news_id == 42
      assert news__tags.tag_id == 42
    end

    test "create_news__tags/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = NewsTagsSchema.create_news__tags(@invalid_attrs)
    end

    test "update_news__tags/2 with valid data updates the news__tags" do
      news__tags = news__tags_fixture()
      update_attrs = %{news_id: 43, tag_id: 43}

      assert {:ok, %News_Tags{} = news__tags} = NewsTagsSchema.update_news__tags(news__tags, update_attrs)
      assert news__tags.news_id == 43
      assert news__tags.tag_id == 43
    end

    test "update_news__tags/2 with invalid data returns error changeset" do
      news__tags = news__tags_fixture()
      assert {:error, %Ecto.Changeset{}} = NewsTagsSchema.update_news__tags(news__tags, @invalid_attrs)
      assert news__tags == NewsTagsSchema.get_news__tags!(news__tags.id)
    end

    test "delete_news__tags/1 deletes the news__tags" do
      news__tags = news__tags_fixture()
      assert {:ok, %News_Tags{}} = NewsTagsSchema.delete_news__tags(news__tags)
      assert_raise Ecto.NoResultsError, fn -> NewsTagsSchema.get_news__tags!(news__tags.id) end
    end

    test "change_news__tags/1 returns a news__tags changeset" do
      news__tags = news__tags_fixture()
      assert %Ecto.Changeset{} = NewsTagsSchema.change_news__tags(news__tags)
    end
  end
end
