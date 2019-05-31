module SettingObjectives
  class KeyResultCreated < Event
    attribute :key_result_id, Types::UUID
    attribute :objective_id, Types::UUID
    attribute :title, String
  end
end
