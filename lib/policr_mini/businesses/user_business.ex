defmodule PolicrMini.UserBusiness do
  use PolicrMini, business: PolicrMini.Schema.User

  def fetch(id, params) when is_integer(id) do
    case id |> get() do
      {:error, :not_found, _} -> create(params |> Map.put(:id, id))
      r -> r
    end
  end

  def create(params) do
    %User{} |> User.changeset(params) |> Repo.insert()
  end
end
