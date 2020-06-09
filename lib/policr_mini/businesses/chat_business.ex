defmodule PolicrMini.ChatBusiness do
  use PolicrMini, business: PolicrMini.Schema.Chat

  def create(params) do
    %Chat{} |> Chat.changeset(params) |> Repo.insert()
  end

  def update(%Chat{} = chat, attrs) do
    chat |> Chat.changeset(attrs) |> Repo.update()
  end

  def fetch(id, params) when is_integer(id) do
    case id |> get() do
      {:error, :not_found, _} -> create(params |> Map.put(:id, id))
      {:ok, chat} -> chat |> update(params)
    end
  end
end
