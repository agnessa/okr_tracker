module SettingObjectives
  class CreateKeyResult < Command
    attribute :objective_id, Types::UUID
    attribute :title, String

    alias :aggregate_id :objective_id
  end
end
