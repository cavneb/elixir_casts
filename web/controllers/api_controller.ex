defmodule ElixirCasts.ApiController do
  use ElixirCasts.Web, :controller

  def index(conn, _params) do
    render(conn, "index.json")
  end
end
