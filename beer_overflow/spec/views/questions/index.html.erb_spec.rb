require 'spec_helper'



describe 'questions/index.html.erb' do



  before do
    @questions = Question.all
  end


  it 'displays question details correctly' do
    assign(:question, Question.create(title: "my question", content: "what does view spec do?"))

    render

    expect(render).to include("my question")
    expect(render).to include("what does view spec do?")
  end
end
