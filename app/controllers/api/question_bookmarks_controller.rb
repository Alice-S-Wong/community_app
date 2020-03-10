class Api::QuestionBookmarksController < ApplicationController
  def index
    if current_user
      @question_bookmarks = QuestionBookmark.where(user_id: current_user.id)
      render "index.json.jb"
    else
      render json: {message: "You must be logged in to view your bookmarks"}, status: :unauthorized
    end
  end
  def create
    if current_user
      @question_bookmark = QuestionBookmark.new(
        user_id: current_user.id,
        question_id: params[:question_id]
      )
      if @question_bookmark.save
        render json: {message: "Question bookmark successfully created"}
      else
        render json: {errors: @list.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "You must be logged in to create a question bookmark"}, status: :unauthorized
    end
  end
  def destroy
    if current_user
      @question_bookmark = QuestionBookmark.find(params[:id])
      if current_user.id == @question_bookmark.user_id
        @question_bookmark.destroy
        render json: {message: "Question bookmark successfully destroyed"}
      else
        render json: {message: "Unauthorized to destroy bookmark"}, status: :unauthorized
      end
    else
      render json: {message: "Must be logged in to destroy a bookmark"}, status: :unauthorized
    end
  end
end
