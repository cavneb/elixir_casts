defmodule ElixirCasts.ApiView do
  use ElixirCasts.Web, :view

  def render("index.json", %{conn: conn}) do
    %{
      href: api_url(conn, :index),
      episodes: %{ href: episode_url(conn, :index) }
    }
  end
end
