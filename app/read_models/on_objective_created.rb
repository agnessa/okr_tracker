class OnObjectiveCreated
  def call(event)
    objective_id = event.data[:objective_id]
    title = event.data[:title]
    quarter_start_date = event.data[:quarter_start_date]
    user_id = event.data[:user_id]
    objective = Objective.create!(
      id: objective_id,
      title: title,
      quarter_start_date: quarter_start_date,
      user_id: user_id
    )
  end
end
