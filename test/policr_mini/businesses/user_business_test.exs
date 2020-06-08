defmodule PolicrMini.UserBusinessTest do
  use PolicrMini.DataCase

  alias PolicrMini.Factory
  alias PolicrMini.UserBusiness

  def build_params(attrs \\ []) do
    user = Factory.build(:user)
    user |> struct(attrs) |> Map.from_struct()
  end

  test "fetch/1" do
    user_params = build_params()
    {:ok, user} = UserBusiness.fetch(123_456_789, user_params)

    assert user.id == user_params.id
    assert user.first_name == user_params.first_name
    assert user.last_name == user_params.last_name
    assert user.username == user_params.username
  end

  test "fetch/1 and existing data" do
    {:ok, user1} = UserBusiness.create(build_params())
    {:ok, user2} = UserBusiness.fetch(user1.id, build_params())

    assert user1 == user2
  end

  test "get/1" do
    {:ok, user1} = UserBusiness.create(build_params())
    {:ok, user2} = UserBusiness.get(user1.id)

    assert user1 == user2
  end
end
