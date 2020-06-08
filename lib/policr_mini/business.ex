defmodule PolicrMini.Business do
  defmacro __using__(schema_module) do
    quote do
      alias unquote(schema_module)
      alias PolicrMini.Repo

      def get(id) do
        case unquote(schema_module) |> Repo.get(id) do
          nil -> {:error, :not_found, %{params: %{entry: unquote(schema_module), id: id}}}
          r -> r
        end
      end
    end
  end

  alias __MODULE__.{User}

  defdelegate get_user(id), to: User, as: :get
end
