require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  describe "GET #index" do
    it "should be the main page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "should go to the specific question page" do
      question = Question.create(:title => 'Title', :content => 'CONTENT STUFF!')
      get :show, id: question.id
      expect(assigns(:question)).to eq(question)
      end
    end

  # describe "Post #create" do
  #   it "should create a new question" do
  #     question = Question.create(title: "hello", content: "world")
  #     post :create, question_id: question.id
  #     response.should redirect_to root_url
  #   end
  # end
end

