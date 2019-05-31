class OnKeyResultCreated
  def call(event)
    objective_id = event.data[:objective_id]
    create_draft_objective(objective_id)
    key_result_id = event.data[:key_result_id]
    title = event.data[:title]
    key_result = KeyResult.new(
      id: key_result_id,
      objective_id: objective_id,
      title: title
    )
    key_result.save!
  end

  private
  def create_draft_objective(objective_id)
    return if Objective.where(id: objective_id).exists?

    Objective.create!(id: objective_id, title: 'Draft')
  end
end
