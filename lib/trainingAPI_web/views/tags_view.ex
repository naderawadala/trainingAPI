defmodule TrainingAPIWeb.TagsView do
  use TrainingAPIWeb, :view
  alias TrainingAPIWeb.TagsView

  def render("index.json", %{tags: tags}) do
    %{data: render_many(tags, TagsView, "tags.json")}
  end

  def render("show.json", %{tags: tags}) do
    %{data: render_one(tags, TagsView, "tags.json")}
  end

  def render("tags.json", %{tags: tags}) do
    %{
      id: tags.id,
      name: tags.name
    }
  end
end
