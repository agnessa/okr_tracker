module SettingObjectives
  class OnCreateKeyResult
    include CommandHandler

    def call(command)
      with_aggregate(SettingObjectives::KeyResult, command.aggregate_id) do |key_result|
        key_result.create(command.objective_id, command.title)
      end
    end
  end
end
