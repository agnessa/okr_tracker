class KeyResultsController < ApplicationController
  def create
    cmd_params = {
      objective_id: params[:objective_id],
      title: params[:title]
    }
    cmd = SettingObjectives::CreateKeyResult.new(cmd_params)
    command_bus.(cmd)
    redirect_to objectives_path, notice: 'Key result created.'
  end
end
