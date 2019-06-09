class OnKeyResultScoreUpdated
  def call(event)
    key_result = KeyResult.find(event.data[:key_result_id])
    key_result.score = event.data[:score] / 100
    key_result.save!

    objective = key_result.objective
    objective.score = objective.key_results.map(&:score).reduce(:+) / objective.key_results.length
    objective.save!
  end
end
