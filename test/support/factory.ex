defmodule PolicrMini.Factory do
  def build(:user) do
    %PolicrMini.Schema.User{
      id: 123_456_789,
      first_name: "小",
      last_name: "明",
      username: "xiaoming"
    }
  end

  def build(:chat) do
    %PolicrMini.Schema.Chat{
      id: 123_456_789_011,
      type: "supergroup",
      title: "Elixir 编程语言",
      small_photo_id: "asdfghjkl",
      big_photo_id: "ASDFGHJKL",
      username: "elixir_cn",
      description: "Elixir 编程语言中文交流群"
    }
  end

  def build(:permission) do
    %PolicrMini.Schema.Permission{
      tg_is_owner: true,
      tg_can_promote_members: true,
      tg_can_restrict_members: true,
      readable: true,
      writable: true
    }
  end

  def build(factory_name, attrs) when is_atom(factory_name) and is_list(attrs) do
    factory_name |> build() |> struct(attrs)
  end
end
