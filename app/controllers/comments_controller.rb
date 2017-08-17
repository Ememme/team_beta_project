class CommentsController < ApplicationController
  before_action :set_announcement, only: [:create]

  def new
    @comment = Comment.new
    @comment.student = current_student
    @comment.announcement = @announcement
    @comment.save
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.student = current_student
    @comment.announcement = Announcement.find(params[:announcement_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to announcements_path, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  private

  def set_announcement
    @announcement = Announcement.find(params[:announcement_id])
  end

  def comment_params
    params.require(:comment).permit(:comment_body, :announcement_id, :student_id)
  end
end
