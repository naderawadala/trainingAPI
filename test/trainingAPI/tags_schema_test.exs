defmodule TrainingAPI.TagsSchemaTest do
  use TrainingAPI.DataCase

  alias TrainingAPI.TagsSchema

  describe "tags" do
    alias TrainingAPI.TagsSchema.Tags

    import TrainingAPI.TagsSchemaFixtures

    @invalid_attrs %{name: nil}

    test "list_tags/0 returns all tags" do
      tags = tags_fixture()
      assert TagsSchema.list_tags() == [tags]
    end

    test "get_tags!/1 returns the tags with given id" do
      tags = tags_fixture()
      assert TagsSchema.get_tags!(tags.id) == tags
    end

    test "create_tags/1 with valid data creates a tags" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tags{} = tags} = TagsSchema.create_tags(valid_attrs)
      assert tags.name == "some name"
    end

    test "create_tags/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TagsSchema.create_tags(@invalid_attrs)
    end

    test "update_tags/2 with valid data updates the tags" do
      tags = tags_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tags{} = tags} = TagsSchema.update_tags(tags, update_attrs)
      assert tags.name == "some updated name"
    end

    test "update_tags/2 with invalid data returns error changeset" do
      tags = tags_fixture()
      assert {:error, %Ecto.Changeset{}} = TagsSchema.update_tags(tags, @invalid_attrs)
      assert tags == TagsSchema.get_tags!(tags.id)
    end

    test "delete_tags/1 deletes the tags" do
      tags = tags_fixture()
      assert {:ok, %Tags{}} = TagsSchema.delete_tags(tags)
      assert_raise Ecto.NoResultsError, fn -> TagsSchema.get_tags!(tags.id) end
    end

    test "change_tags/1 returns a tags changeset" do
      tags = tags_fixture()
      assert %Ecto.Changeset{} = TagsSchema.change_tags(tags)
    end
  end
end
