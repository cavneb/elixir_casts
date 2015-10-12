defmodule ElixirCasts.Episode do
  use ElixirCasts.Web, :model

  schema "episodes" do
    field :title, :string
    field :description, :string
    field :link, :string
    field :guid, :string
    field :pub_date, :string
    field :video_url, :string

    timestamps
  end

  @required_fields ~w(title description link guid pub_date video_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
