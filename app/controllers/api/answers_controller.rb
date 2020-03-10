class Api::AnswersController < ApplicationController
  def create
    if current_user
      @answer = Answer.new(
        user_id: current_user.id,
        title: params[:title],
        body: params[:body],
        question_id: params[:question_id]
      )
      if @answer.save
        render "show.json.jb"
      else
        render json: {errors: @list.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "You must be logged in to create a answer"}, status: :unauthorized
    end
  end
  def show
    @answer = Answer.find(params[:id])
    render "show.json.jb"
  end
  def update
    if current_user
      @answer = Answer.find(params[:id])
      if current_user.id == @answer.user_id
        @answer.title = params[:title] || @answer.title
        @answer.body = params[:body] || @answer.body
        @answer.question_id = params[:question_id] || @answer.question_id
        if @answer.save!
          render "show.json.jb"
        else
          render json: {errors: @list.errors.full_messages}, status: :unprocessable_entity
        end
      else
        render json: {message: "Unauthorized to edit answer"}, status: :unauthorized
      end
    end
  end
end
