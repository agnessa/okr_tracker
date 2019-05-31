RSpec.describe SettingObjectives::OnCreateObjective do
  let(:user_id) { 1 }
  let(:objective_id) { SecureRandom.uuid }
  let(:objective_attributes) {
    {
      objective_id: objective_id,
      title: 'test',
      quarter_start_date: '2019-04-01',
      user_id: user_id
    }
  }
  it 'creates an objective' do
    stream = "SettingObjectives::Objective$#{objective_id}"
    arrange(stream, [])
    created = act(
      stream,
      SettingObjectives::CreateObjective.new(objective_attributes)
    )
    expect(created.map(&:data)).to eq(
      [
        SettingObjectives::ObjectiveCreated.new(data: objective_attributes)
      ].map(&:data)
    )
  end
end
