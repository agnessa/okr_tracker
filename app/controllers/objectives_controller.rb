class ObjectivesController < ApplicationController
  def index
    @objectives = Objective.
      where(quarter_start_date: current_quarter.start_date).
      order(created_at: :desc)
    @objective_id = SecureRandom.uuid
    @current_quarter = current_quarter
  end

  def create
    cmd_params = {
      objective_id: params[:objective_id],
      title: params[:title],
      user_id: current_user.id,
      quarter_start_date: params[:quarter_start_date]
    }
    cmd = SettingObjectives::CreateObjective.new(cmd_params)
    command_bus.(cmd)
    @objective = Objective.find_by_id(cmd.objective_id)
    redirect_to objectives_path, notice: 'Objective created.'
  end

  # TODO: multi user
  def current_user
    User.new(1)
  end

  # TODO: persisted class
  User = Struct.new(:id)

  # TODO: multi quarter
  def current_quarter
    SettingObjectives::Quarter.new(Date.parse('20190401'))
  end
end
