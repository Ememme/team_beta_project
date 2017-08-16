class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:update, :destroy]

  def index
    @announcements = Announcement.where(room: current_student.room).order(created_at: :desc)
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.student = current_student
    @announcement.room = @announcement.student.room
    if @announcement.save
      redirect_to announcements_path, error: 'well done!'
    else
      redirect_to announcements_path, error: @announcement.error.messages
    end
  end

  def update
  end

  def destroy
  end

  private

  def announcement_params
    params.require(:announcement).permit(:news_body, :student_id, :room_id)
  end

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end


end
