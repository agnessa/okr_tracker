module SettingObjectives
  class OnCreateKeyResult
    include CommandHandler

    def call(command)
      with_aggregate(Objective, command.aggregate_id) do |objective|
        objective.create_key_result(command.title)
      end
    end
  end
end
