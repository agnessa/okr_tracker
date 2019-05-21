class OnObjectiveCreated
  def call(event)
    objective_id = event.data[:objective_id]
    title = event.data[:title]
    quarter_start_date = event.data[:quarter_start_date]
    user_id = event.data[:user_id]
    objective = Objective.find_by(uid: objective_id)
    if objective
      objective.title = title
      objective.quarter_start_date = quarter_start_date
      objective.user_id = user_id
    else
      objective = Objective.new(
        uid: objective_id,
        title: title,
        quarter_start_date: quarter_start_date,
        user_id: user_id
      )
    end
    objective.save!
  end
end
