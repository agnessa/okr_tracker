class OnKeyResultScoreUpdated
  def call(event)
    key_result = KeyResult.find(event.data[:key_result_id])
    key_result.score = event.data[:score] / 100
    key_result.save!
  end
end
