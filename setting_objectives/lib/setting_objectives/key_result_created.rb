module SettingObjectives
  class KeyResultCreated < Event
    attribute :objective_id, Types::UUID
    attribute :title, String
  end
end
