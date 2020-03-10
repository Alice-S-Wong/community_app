class Api::AnswerBookmarksController < ApplicationController
  def index
    if current_user
      @answer_bookmarks = AnswerBookmark.where(user_id: current_user.id)
      render "index.json.jb"
    else
      render json: {message: "You must be logged in to view your bookmarks"}, status: :unauthorized
    end
  end
  def create
    if current_user
      @answer_bookmark = AnswerBookmark.new(
        user_id: current_user.id,
        answer_id: params[:answer_id]
      )
      if @answer_bookmark.save
        render json: {message: "Answer bookmark successfully created"}
      else
        render json: {errors: @list.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "You must be logged in to create a answer bookmark"}, status: :unauthorized
    end
  end
  def destroy
    if current_user
      @answer_bookmark = AnswerBookmark.find(params[:id])
      if current_user.id == @answer_bookmark.user_id
        @answer_bookmark.destroy
        render json: {message: "Answer bookmark successfully destroyed"}
      else
        render json: {message: "Unauthorized to destroy bookmark"}, status: :unauthorized
      end
    else
      render json: {message: "Must be logged in to destroy a bookmark"}, status: :unauthorized
    end
  end
end
