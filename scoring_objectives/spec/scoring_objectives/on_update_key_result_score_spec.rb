RSpec.describe ScoringObjectives::OnUpdateKeyResultScore do
  let(:objective_id) { SecureRandom.uuid }
  let(:key_result_id) { SecureRandom.uuid }
  let(:key_result_attributes) {
    {
      objective_id: objective_id,
      key_result_id: key_result_id,
      title: 'test'
    }
  }
  let(:key_result_score_attributes) {
    {
      key_result_id: key_result_id,
      score: 15
    }
  }
  it 'updates the score' do
    KeyResult.create(id: key_result_id)
    stream = "ScoringObjectives::KeyResultScore$#{key_result_id}"
    arrange(stream, [])
    #arrange(stream, [SettingObjectives::KeyResultCreated.new(data: key_result_attributes)])
    updated = act(
      stream,
      ScoringObjectives::UpdateKeyResultScore.new(key_result_score_attributes)
    )
    expect(updated.map(&:data)).to eq(
      [
        ScoringObjectives::KeyResultScoreUpdated.new(data: key_result_score_attributes)
      ].map(&:data)
    )
  end
end
