defmodule TrainingAPIWeb.NewsView do
  use TrainingAPIWeb, :view
  alias TrainingAPIWeb.NewsView

  def render("index.json", %{news: news}) do
    %{data: render_many(news, NewsView, "news.json")}
  end

  def render("show.json", %{news: news}) do
    %{data: render_one(news, NewsView, "news.json")}
  end

  def render("news.json", %{news: news}) do
    %{
      id: news.id,
      headline: news.headline,
      text: news.text,
      publication: news.publication,
      date: news.date
    }
  end
end
