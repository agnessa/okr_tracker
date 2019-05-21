module SettingObjectives
  class OnCreateObjective
    include CommandHandler

    def call(command)
      with_aggregate(Objective, command.aggregate_id) do |objective|
        objective.create(
          command.title, command.quarter_start_date, command.user_id
        )
      end
    end
  end
end
