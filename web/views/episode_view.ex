defmodule ElixirCasts.EpisodeView do
  use ElixirCasts.Web, :view

  def render("index.json", %{episodes: episodes, conn: conn}) do
    %{
      href: episode_url(conn, :index),
      episodes: render_many(episodes, ElixirCasts.EpisodeView, "episode_link.json", %{conn: conn})
    }
  end

  def render("show.json", %{episode: episode, conn: conn}) do
    render_one(episode, ElixirCasts.EpisodeView, "episode.json", %{conn: conn})
  end

  def render("episode_link.json", %{episode: episode, conn: conn}) do
    %{
      title: episode.title,
      pub_date: episode.pub_date,
      href: episode_url(conn, :show, episode.id)
    }
  end

  def render("episode.json", %{episode: episode, conn: conn}) do
    %{href: episode_url(conn, :show, episode.id),
      id: episode.id,
      title: episode.title,
      description: episode.description,
      link: episode.link,
      guid: episode.guid,
      pub_date: episode.pub_date,
      video_url: episode.video_url}
  end
end
