require 'spec_helper'
require 'shoulda-matchers'

describe "Routes" do
  describe "QuestionsController", :type => :routing do
    it "routes get index" do
      expect(:get => "questions").to route_to(
        :controller => "questions",
        :action => "index"
        )
    end
    it "routes get show" do
      expect(:get => "questions/1").to route_to(
        :controller => "questions",
        :action => "show",
        :id => "1"
        )
    end
  end
end
