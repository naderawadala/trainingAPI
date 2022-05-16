defmodule TrainingAPIWeb.News_TagsView do
  use TrainingAPIWeb, :view
  alias TrainingAPIWeb.News_TagsView

  def render("index.json", %{news_tags: news_tags}) do
    %{data: render_many(news_tags, News_TagsView, "news__tags.json")}
  end

  def render("show.json", %{news__tags: news__tags}) do
    %{data: render_one(news__tags, News_TagsView, "news__tags.json")}
  end

  def render("news__tags.json", %{news__tags: news__tags}) do
    %{
      id: news__tags.id,
      news_id: news__tags.news_id,
      tag_id: news__tags.tag_id
    }
  end
end
