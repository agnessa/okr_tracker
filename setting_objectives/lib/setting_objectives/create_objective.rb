module SettingObjectives
  class CreateObjective < Command
    attribute :objective_id, Types::UUID
    attribute :title, String
    attribute :user_id, Types::Coercible::Integer # TODO: no idea why such type, copy - paste - figure out later
    attribute :quarter_start_date, String # TODO

    alias :aggregate_id :objective_id
  end
end
