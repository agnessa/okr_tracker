class KeyResultsController < ApplicationController
  def create
    @key_result_id = SecureRandom.uuid
    cmd_params = {
      key_result_id: @key_result_id,
      objective_id: params[:objective_id],
      title: params[:title]
    }
    cmd = SettingObjectives::CreateKeyResult.new(cmd_params)
    command_bus.(cmd)
    redirect_to objectives_path, notice: 'Key result created.'
  end

  def update_score
    cmd_params = {
      key_result_id: params[:id],
      score: params[:score]
    }
    cmd = ScoringObjectives::UpdateKeyResultScore.new(cmd_params)
    command_bus.(cmd)
    redirect_to objectives_path, notice: 'Score updated.'
  end
end
