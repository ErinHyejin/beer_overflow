class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      render json: @answer, status: :created
    else
      render json: @answer.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    path = @answer.question
    @answer.destroy
    redirect_to path
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to @answer.question
  end

  def upvote
    question = Question.find(params[:id])
    answer = question.answers.find(params[:answer_id])
    answer.vote_count += 1
    answer.save
    redirect_to "/questions/#{question.id}"
  end

  def downvote
    question = Question.find(params[:id])
    answer = question.answers.find(params[:answer_id])
    answer.vote_count -= 1
    answer.save
    redirect_to "/questions/#{question.id}"
  end

  private
  def answer_params
    params.require(:answer).permit(:title, :content)
  end
end
