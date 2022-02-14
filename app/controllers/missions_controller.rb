class MissionsController < ApplicationController

  def index
    @missions = Mission.all.page(params[:page])
  end

  def new
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user_id = current_user.id
    if @mission.save
      redirect_to missions_path, flash: { notice: "「#{@mission.input_main}のミッションを作成しました」"}
    else
      redirect_to new_mission_path, flash: {
        mission: @mission,
        error_messages: @mission.errors.full_messages
      }
    end
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def mission_params
    params.require(:mission).permit(:input_alias, :input_description, :input_library, :input_main, :input_reading, :input_reference_site, :input_related, :input_remarks, :input_sample)
  end
end
