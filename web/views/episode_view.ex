defmodule ElixirCasts.EpisodeView do
  use ElixirCasts.Web, :view

  def render("index.json", %{episodes: episodes}) do
    %{data: render_many(episodes, ElixirCasts.EpisodeView, "episode.json")}
  end

  def render("show.json", %{episode: episode}) do
    %{data: render_one(episode, ElixirCasts.EpisodeView, "episode.json")}
  end

  def render("episode.json", %{episode: episode}) do
    %{id: episode.id,
      title: episode.title,
      description: episode.description,
      link: episode.link,
      guid: episode.guid,
      pub_date: episode.pub_date,
      video_url: episode.video_url}
  end
end
