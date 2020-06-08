defmodule PolicrMini.Factory do
  def build(:user) do
    %PolicrMini.Schema.User{
      id: 123_456_789,
      first_name: "小",
      last_name: "明",
      username: "xiaoming"
    }
  end
end
