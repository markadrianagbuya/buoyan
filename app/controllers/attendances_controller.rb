class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    attendance = AttendanceRecording.new(attendance_params)
    respond_to do |format|
      if attendance.record_attending
        format.html { redirect_to attendance.workshop, notice: "#{attendance.student.name} was marked as attending" }
        format.json { render :show, status: :created, location: attendance.workshop }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1.json
  def destroy
    attendance = AttendanceRecording.new(@attendance.attributes.slice("workshop_id", "student_id"))
    attendance.record_absent
    
    respond_to do |format|
      format.html { redirect_to attendance.workshop, notice: "#{attendance.student.name} was marked as absent." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:student_id, :workshop_id)
    end
end
