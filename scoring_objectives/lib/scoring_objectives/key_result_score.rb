require 'aggregate_root'

module ScoringObjectives
  class KeyResultScore
    include AggregateRoot

    def initialize(id)
      @id = id
    end

    def update_score(score)
      apply KeyResultScoreUpdated.new(data: {key_result_id: @id, score: score})
    end

    on KeyResultScoreUpdated do |event|
      @score = event.data[:score]
    end
  end
end
