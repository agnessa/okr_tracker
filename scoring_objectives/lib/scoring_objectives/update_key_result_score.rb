module ScoringObjectives
  class UpdateKeyResultScore < Command
    attribute :key_result_id, Types::UUID
    attribute :score, Types::Coercible::Decimal

    alias :aggregate_id :key_result_id
  end
end
