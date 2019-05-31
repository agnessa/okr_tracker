module ScoringObjectives
  class OnUpdateKeyResultScore
    include CommandHandler

    def call(command)
      with_aggregate(KeyResultScore, command.aggregate_id) do |key_result_score|
        key_result_score.update_score(command.score)
      end
    end
  end
end