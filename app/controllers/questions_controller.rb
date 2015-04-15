class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(vote_count: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(vote_count: :desc)
  end

  def create
    @new_question = Question.new(question_params)
    if @new_question.save
      render json: @new_question, status: :created
    else
      render json: @new_question.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
    # redirect_to questions_show
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to @question
  end

  def upvote
    @question = Question.find(params[:id])
    @question.vote_count += 1

    @question.save
    redirect_to root_path
  end

  def downvote
    @question = Question.find(params[:id])
    @question.vote_count -= 1

    @question.save
    redirect_to root_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :content)
  end

end

