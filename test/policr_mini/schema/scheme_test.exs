defmodule PolicrMini.Schema.SchemeTest do
  use ExUnit.Case

  alias PolicrMini.Factory
  alias PolicrMini.Schema.Scheme

  describe "schema" do
    test "schema metadata" do
      assert Scheme.__schema__(:source) == "schemes"

      assert Scheme.__schema__(:fields) ==
               [
                 :id,
                 :chat_id,
                 :verification_mode,
                 :seconds,
                 :killing_method,
                 :highlighted,
                 :inserted_at,
                 :updated_at
               ]
    end

    assert Scheme.__schema__(:primary_key) == [:id]
  end

  test "changeset/2" do
    scheme = Factory.build(:scheme, chat_id: 123_456_789_011)

    updated_verification_mode = 1
    updated_seconds = 120
    updated_killing_method = 1
    updated_highlighted = false

    params = %{
      "verification_mode" => updated_verification_mode,
      "seconds" => updated_seconds,
      "killing_method" => updated_killing_method,
      "highlighted" => updated_highlighted
    }

    changes = %{
      verification_mode: :custom,
      seconds: updated_seconds,
      killing_method: :kick,
      highlighted: updated_highlighted
    }

    changeset = Scheme.changeset(scheme, params)
    assert changeset.params == params
    assert changeset.data == scheme
    assert changeset.changes == changes
    assert changeset.validations == []

    assert changeset.required == [
             :chat_id
           ]

    assert changeset.valid?
  end
end