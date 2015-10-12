defmodule ElixirCasts.EpisodeTest do
  use ElixirCasts.ModelCase

  alias ElixirCasts.Episode

  @valid_attrs %{description: "some content", guid: "some content", link: "some content", pub_date: "2010-04-17 14:00:00", title: "some content", video_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Episode.changeset(%Episode{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Episode.changeset(%Episode{}, @invalid_attrs)
    refute changeset.valid?
  end
end
