require 'rails_event_store'
require 'aggregate_root'
require 'arkency/command_bus'


Rails.configuration.to_prepare do
  Rails.configuration.event_store = RailsEventStore::Client.new(
    mapper: RubyEventStore::Mappers::Default.new(serializer: JSON)
  )
  Rails.configuration.command_bus = Arkency::CommandBus.new

  AggregateRoot.configure do |config|
    config.default_event_store = Rails.configuration.event_store
  end

  Rails.configuration.event_store.tap do |store|
    store.subscribe(OnObjectiveCreated, to: [SettingObjectives::ObjectiveCreated])
    store.subscribe(OnKeyResultCreated, to: [SettingObjectives::KeyResultCreated])
    store.subscribe(OnKeyResultScoreUpdated, to:[ScoringObjectives::KeyResultScoreUpdated])
  end

  Rails.configuration.command_bus.tap do |bus|
    bus.register(SettingObjectives::CreateObjective, SettingObjectives::OnCreateObjective.new)
    bus.register(SettingObjectives::CreateKeyResult, SettingObjectives::OnCreateKeyResult.new)
    bus.register(ScoringObjectives::UpdateKeyResultScore, ScoringObjectives::OnUpdateKeyResultScore.new)
  end
end
