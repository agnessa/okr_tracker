module SettingObjectives
  class KeyResult
    include AggregateRoot

    attr_reader :title

    def initialize(id)
      @id = id
    end

    def create(objective_id, title)
      apply KeyResultCreated.new(
        data: {
          key_result_id: @id, objective_id: objective_id, title: title
        }
      )
    end

    on KeyResultCreated do |event|
      key_result_id = event.data[:id]
      objective_id = event.data[:objective_id]
      title = event.data[:title]
    end
  end
end
