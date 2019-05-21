class OnKeyResultCreated
  def call(event)
    objective_id = event.data[:objective_id]
    create_draft_objective(objective_id)
    title = event.data[:title]
    key_result = KeyResult.new(
      objective_id: objective_id,
      title: title
    )
    key_result.save!
  end

  private
  def create_draft_objective(uid)
    return if Objective.where(uid: uid).exists?

    Objective.create!(uid: uid, title: 'Draft')
  end
end
