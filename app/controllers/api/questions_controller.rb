class Api::QuestionsController < ApplicationController
  def index
    @questions = Question.all
    render "index.json.jb"
  end
  def create
    if current_user
      @question = Question.new(
        user_id: current_user.id,
        title: params[:title],
        body: params[:body]
      )
      if @question.save
        render "show.json.jb"
      else
        render json: {errors: @list.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "You must be logged in to create a question"}, status: :unauthorized
    end
  end
  def show
    @question = Question.find(params[:id])
    render "show.json.jb"
  end
  def update
    if current_user
      @question = Question.find(params[:id])
      if current_user.id == @question.user_id
        @question.title = params[:title] || @question.title
        @question.body = params[:body] || @question.body
        if @question.save
          render "show.json.jb"
        else
          render json: {errors: @list.errors.full_messages}, status: :unprocessable_entity
        end
      else
        render json: {message: "Unauthorized to edit question"}, status: :unauthorized
      end
    end
  end
end
