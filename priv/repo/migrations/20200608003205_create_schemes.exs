defmodule PolicrMini.Repo.Migrations.CreateSchemes do
  use PolicrMini.Migration
  alias PolicrMini.EctoEnums.{VerificationModeEnum, KillingMethodEnum}

  def change do
    create table(:schemes) do
      add :chat_id, references(:chats), comment: "聊天编号"
      add :verification_mode, VerificationModeEnum.type(), comment: "验证模式"
      add :seconds, :integer, comment: "验证时间（秒）"
      add :killing_method, KillingMethodEnum.type(), comment: "击杀方法"
      add :is_highlighted, :boolean, comment: "是否突出显示"

      timestamps()
    end
  end
end
