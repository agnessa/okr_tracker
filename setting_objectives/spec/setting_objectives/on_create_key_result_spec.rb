RSpec.describe SettingObjectives::OnCreateKeyResult do
  let(:user_id) { 1 }
  let(:objective_id) { SecureRandom.uuid }
  let(:key_result_id) { SecureRandom.uuid }
  let(:key_result_attributes) {
    {
      key_result_id: key_result_id,
      objective_id: objective_id,
      title: 'test'
    }
  }
  it 'creates an objective' do
    stream = "SettingObjectives::KeyResult$#{key_result_id}"
    arrange(stream, [])
    created = act(
      stream,
      SettingObjectives::CreateKeyResult.new(key_result_attributes)
    )
    expect(created.map(&:data)).to eq(
      [
        SettingObjectives::KeyResultCreated.new(data: key_result_attributes)
      ].map(&:data)
    )
  end
end
