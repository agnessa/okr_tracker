module SettingObjectives
  class ObjectiveCreated < Event
    attribute :objective_id, Types::UUID
    attribute :title, String
    attribute :user_id, Types::ID
    attribute :quarter_start_date, String # TODO
  end
end
