defmodule PolicrMini.Business.User do
  use PolicrMini.Business, PolicrMini.Schema.User

  def fetch(id, params) when is_integer(id) do
    case id |> get() do
      {:error, :not_found, _} -> create(params)
      r -> {:ok, r}
    end
  end

  defp create(params) do
    %User{} |> User.changeset(params) |> Repo.insert()
  end
end
