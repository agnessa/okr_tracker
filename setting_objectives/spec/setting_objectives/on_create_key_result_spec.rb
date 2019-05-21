RSpec.describe SettingObjectives::OnCreateKeyResult do
  let(:user_id) { 1 }
  let(:aggregate_id) { SecureRandom.uuid }
  let(:key_result_attributes) {
    {
      objective_id: aggregate_id,
      title: 'test'
    }
  }
  it 'creates an order' do
    stream = "SettingObjectives::Objective$#{aggregate_id}"
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