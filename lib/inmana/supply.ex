defmodule Inmana.Supply do
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :responsible, :expiration_date, :restaurant_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field :description, :string
    field :responsible, :string
    field :expiration_date, :date

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  # Validações de dados
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:responsible, min: 3)
    |> validate_length(:description, min: 3)
  end
end
