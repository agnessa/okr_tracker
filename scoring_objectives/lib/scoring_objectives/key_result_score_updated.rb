module ScoringObjectives
  class KeyResultScoreUpdated < Event
    attribute :key_result_id, Types::UUID
    attribute :score, Types::Coercible::Decimal
  end
end
