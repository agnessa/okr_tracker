module SettingObjectives
  class CreateKeyResult < Command
    attribute :key_result_id, Types::UUID
    attribute :objective_id, Types::UUID
    attribute :title, String

    alias :aggregate_id :objective_id
  end
end
