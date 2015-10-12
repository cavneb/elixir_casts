defmodule Mix.Tasks.ElixirCasts.ImportScreencasts do
  use Mix.Task

  alias ElixirCasts.Repo
  alias ElixirCasts.Episode

  @shortdoc "Imports screencasts from ElixirSips.com"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(args) do
    Repo.start_link
    args |> parse_args |> fetch_feed |> import_screencasts
  end

  defp fetch_feed([]) do
    Mix.shell.info "No arguments given. Usage:\nmix elixir_casts.import_screencasts --username=USERNAME --password=PASSWORD"
  end

  defp fetch_feed(options) do
    username = options[:username]
    password = options[:password]
    auth = [hackney: [basic_auth: {username, password}]]
    url = "https://elixirsips.dpdcart.com/feed"
    HTTPoison.start
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url, %{}, auth)
    {:ok, feed, _} = FeederEx.parse(body)
    feed.entries
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args, switches: [username: :string, password: :string])
    options
  end

  defp import_screencasts(entries) do
    Enum.map entries, fn(entry) -> save_episode(entry) end
  end

  defp save_episode(entry) do
    params = %{title: entry.title, description: entry.summary, link: entry.link, guid: entry.id, pub_date: entry.updated, video_url: entry.enclosure.url}
    changeset = Episode.changeset(%Episode{}, params)
    case Repo.insert(changeset) do
      {:ok, _episode} ->
        IO.puts "Added episode #{_episode.id}"
      {:error, changeset} ->
        IO.puts "Errors found:"
        Enum.map(changeset.errors, fn {field, detail} ->
          IO.puts "- #{field}: #{detail}"
        end)
    end
  end
end
