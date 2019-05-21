require 'aggregate_root'

module SettingObjectives
  class Objective
    include AggregateRoot

    def initialize(id)
      @id = id
      @key_results = []
    end

    def create(title, quarter_start_date, user_id)
      apply ObjectiveCreated.new(
        data: {
          objective_id: @id,
          title: title,
          quarter_start_date: quarter_start_date,
          user_id: user_id
        }
      )
    end

    def create_key_result(title)
      apply KeyResultCreated.new(data: {objective_id: @id, title: title})
    end

    on ObjectiveCreated do |event|
      @title = event.data[:title]
      @quarter_start_date = event.data[:quarter_start_date]
      @user_id = event.data[:user_id]
    end

    on KeyResultCreated do |event|
      title = event.data[:title]
      key_result = KeyResult.new(title)
      @key_results << key_result
    end
  end
end
